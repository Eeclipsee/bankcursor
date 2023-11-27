defmodule BankcursorWeb.UsersController do
    use BankcursorWeb, :controller

    alias Bankcursor.Users
    alias Users.User

    action_fallback BankcursorWeb.FallbackController

    def create(conn, params) do
        with {:ok, %User{} = user} <- Users.create(params) do
            conn
            |> put_status(:created)
            |> render(:create, user: user)
        end
    end

    def show(conn, %{"id" => id}) do
        with {:ok, %User{} = user} <- Users.get(id) do
            conn
            |> put_status(:ok)
            |> render(:get, user: user)
        end
    end
end
