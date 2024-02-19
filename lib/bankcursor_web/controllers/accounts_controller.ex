defmodule BankcursorWeb.AccountsController do
    use BankcursorWeb, :controller

    alias Bankcursor.Accounts
    alias Accounts.Account

    action_fallback BankcursorWeb.FallbackController

    def create(conn, params) do
        with {:ok, %Account{} = account} <- Accounts.create(params) do
          conn
          |> put_status(:created)
          |> render(:create, account: account)
        end
    end
end
