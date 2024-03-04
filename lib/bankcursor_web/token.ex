defmodule BankcursorWeb.Token do
  alias Phoenix.Token
  alias BankcursorWeb.Endpoint
  @sign_salt "bankcursor_api"

  def sign(user) do
    Token.sign(Endpoint, @sign_salt, %{user_id: user.id})
  end

  def verify(token), do: Token.verify(Endpoint, @sign_salt, token)
end
