defmodule BankcursorWeb.Plugs.Auth do

  import Plug.Conn

  alias BankcursorWeb.Token

  def init(opts), do: opts

  def call(conn, _opts) do
    with ["bearer " <> token]  <- Plug.Conn.get_req_header(conn, "authorization"),
          {:ok, data} <- Token.verify(token) do
      assign(conn, :user_id, data)
    else
      _error ->
        conn
        |> put_status(:unauthorized)
        |> Phoenix.Controller.put_view(json: BankcursorWeb.ErrorJSON)
        |> Phoenix.Controller.render(:error, status: :unauthorized)
        |> halt()
    end
  end
end
