defmodule Bankcursor.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias Bankcursor.Users.User
  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to: :user, User

    timestamps()
  end

  def changeset(account \\%__MODULE__{}, params) do
    account
    |> cast(params, @required_params)
    |> validade_required(@required_params)
    |> chack_constraint(:balance, name: :balance_must_be_positive)
  end

end
