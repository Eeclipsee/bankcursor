defmodule BankcursorWeb.FallbackController do
    use BankcursorWeb, :controller


    def call(conn, {:error, changeset}) do
        conn
        |> put_status(:bad_request)
        |> put_view(json: BankcursorWeb.ErrorJSON)
        |> render(:error, changeset: changeset)
    end
end