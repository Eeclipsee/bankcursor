defmodule BankcursorWeb.UsersController do
    use BankcursorWeb, :controller
    alias Bankcursor.Users.Create

    def create(conn, params) do      
#       |> Create.call()
#       |> handle_response()        
        params
        |> Create.call()
        |> handle_response(conn)
    end

        
    def handle_response({:ok, user}, conn) do
        conn
        |> put_status(:created)
        |> render(:create, user: user)
    end

   # def handle_response({:error, _changeset} = error, conn) do
    #    conn
     #   |> put_status(:bad_request)
      #  |> render("error.json", error: error)
    #end
end