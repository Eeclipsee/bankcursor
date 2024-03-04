defmodule BankcursorWeb.UsersController do
    use BankcursorWeb, :controller

    alias Bankcursor.Users
    alias Users.User

    alias BankcursorWeb.Token

    action_fallback BankcursorWeb.FallbackController

    def create(conn, params) do
        with {:ok, %User{} = user} <- Users.create(params) do
            conn
            |> put_status(:created)
            |> render(:create, user: user)
        end
    end

    def delete(conn, %{"id" => id}) do
        with {:ok, %User{} = user} <- Users.delete(id) do
            conn
            |> put_status(:ok)
            |> render(:delete, user: user)
        end
    end

    def show(conn, %{"id" => id}) do
        with {:ok, %User{} = user} <- Users.get(id) do
            conn
            |> put_status(:ok)
            |> render(:get, user: user)
        end
    end

    def update(conn, params) do
        with {:ok, %User{} = user} <- Users.update(params) do
            conn
            |> put_status(:ok)
            |> render(:update, user: user)
        end
    end

    def login(conn, params) do
        with {:ok, %User{} = user} <- Users.login(params) do
            token = Token.sign(user)
            
            conn
            |> put_status(:ok)
            |> render(:login, token: token)
        end
    end
end
