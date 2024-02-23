defmodule BankcursorWeb.AccountsJSON do
    alias Bankcursor.Accounts.Account

    def create(%{account: account}) do
        %{
            message: "Conta criado com sucesso",
            data: data(account)
        }
    end

    def transaction(%{transaction: %{witdraw: from_account, deposit: to_account}}) do
        %{
            message: "Transferencia Realizada!",
            from_account: data(from_account),
            to_account: data(to_account)
        }
    end

    defp data(%Account{} = account) do
        %{
            id: account.id,
            balance: account.balance,
            user_id: account.user_id
        }
    end
end
