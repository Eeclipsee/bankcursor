defmodule BankcursorWeb.FallbackController do
    use BankcursorWeb, :controller
    
    def call(conn, {:error, :not_found}) do
        conn
        |> put_status(:not_found)
        |> put_view(json: BankcursorWeb.ErrorJSON)
        |> render(:error, status: :not_found)
    end

       def call(conn, {:error, :bad_request}) do
        conn
        |> put_status(:bad_request)
        |> put_view(json: BankcursorWeb.ErrorJSON)
        |> render(:error, status: :bad_request)
    end

    def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
        conn
        |> put_status(:bad_request)
        |> put_view(json: BankcursorWeb.ErrorJSON)
        |> render(:error, changeset: changeset)
    end

     def call(conn, {:errors, message}) do
        conn
        |> put_status(:bad_request)
        |> put_view(json: BankcursorWeb.ErrorJSON)
        |> render(:errors, message: message)
    end


end