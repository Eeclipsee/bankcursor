defmodule BankcursorWeb.WelcomeController do
    use BankcursorWeb, :controller

    def index(conn, _params) do
        conn
        |> put_status(:ok)
        |> json(%{message: "bem vindo ao bankcursor"})
    end
end