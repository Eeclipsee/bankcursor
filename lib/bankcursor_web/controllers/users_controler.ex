defmodule BankcursorWeb.UsersController do
    use BankcursorWeb, :controller

    def create(conn, params) do
       params
       |> Create.call()
       |> handle_response()
    end

    def handle_response({:ok, user}, conn) do
        conn
        |> put_status(:created)
        |> render(:create, user: user)
    end
end