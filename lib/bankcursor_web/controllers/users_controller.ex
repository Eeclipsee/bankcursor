defmodule BankcursorWeb.UsersController do
    use BankcursorWeb, :controller
    alias Bankcursor.Users.Create
    alias Bankcursor.Users.User

    action_fallback BankcursorWeb.FallbackController

    def create(conn, params) do
        with {:ok, %User{} = user} <- Create.call(params) do
            conn
            |> put_status(:created)
            |> render(:create, user: user)
        end
    end
end
