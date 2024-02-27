defmodule Bankcursor.Users.Verify do
  alias Bankcursor.Users
  alias Users.User

  def call(%{"id" => id, "password" => password}) do
    case Users.Get(id) do
      {:ok, user} -> Pbkdf2.verify_pass(password, stored_hash)
    end
  end
end
