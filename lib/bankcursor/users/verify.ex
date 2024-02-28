 defmodule Bankcursor.Users.Verify do
  alias Bankcursor.Users
  alias Users.User

  def call(%{"id" => id, "password" => password}) do
    case Users.get(id) do
      {:ok, user} -> Pbkdf2.verify_pass(password, user.password_hash)
      {:error, _} = error -> error
    end
  end

  def verify(user, password) do
    case Pbkdf2.verify_pass(password, user.password_hash) do
      true -> {:ok, :valid_password}
      false -> {:error, :unauthorized}
    end
  end
end
