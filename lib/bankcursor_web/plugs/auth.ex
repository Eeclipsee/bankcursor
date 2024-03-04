defmodule BankcursorWeb.Plugs.Auth do
    import Plug.Conn

    alias BankcursorWeb.Token

    def init(opts), do: opts

    def call(conn,_opts) do
        with ["Bearer " <> token] <- get_req_header(conn, "autorization"),
            {:ok, data} <- Token.verify(token) do
            assign(conn, :user_id, data)
        else
            _error ->
                conn
                |> put_status(:unauthorized)
                |> put_view(json: BankcursorWeb.ErrorJSON)
                |> render(:error, status: :unauthorized)
                |> halt()
        end
    end
end