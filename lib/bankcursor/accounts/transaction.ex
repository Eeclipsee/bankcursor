defmodule Bankcursor.Accounts.Transaction do

  alias Bankcursor.Accounts
  alias Accounts.Account
  alias Bankcursor.Repo
  alias Ecto.Multi

  def call(from_account_id, to_account_id, value) do
    with %Account{} = from_account <- Repo.get(Account, from_account_id),
         %Account{} = to_account <- Repo.get(Account, to_account_id)
         {:ok, value} <- Decimal.cast(value) do
      Multi.new()
      |> withdraw(from_account, value)
      |> deposit(to_account, value)
      |> Repo.transaction()
    else
      nil -> {:error, :not_found}
      :error -> {:error, "Invalid Value"}
    end
  end

  defp withdraw(multi, to_account, value) do
    new_balance = Decimal.sub(to_account.balance, value)
    changeset = Account.changeset(to_account, %{balance: new_balance})
    Multi.update(multi, :withdraw, changeset )
  end

  defp deposit(multi, from_account, value) do
    new_balance = Decimal.add(from_account.balance, value)
    changeset = Account.changeset(from_account, %{balance: new_balance})
    Multi.update(multi, :deposit, changeset)
  end
end
