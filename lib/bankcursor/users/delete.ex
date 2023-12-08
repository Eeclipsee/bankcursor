defmodule Bankcursor.Users.Delete do
  alias Bankcursor.Users.User
  alias Bankcursor.Repo

  def call(id) do
    case Repo.get(User, id) do
        nil -> {:error, :not_found}
        user -> Repo.delete(user)
    end
  end
end
