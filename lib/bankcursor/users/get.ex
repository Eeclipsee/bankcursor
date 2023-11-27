defmodule Bankcursor.Users.Get do
    alias Bankcursor.Users.User
    alias Bankcursor.Repo

    def call(id) do
        case Repo.get(User, id) do
            nil -> {:error, :not_found}
            user -> {:ok, user}
        end
    end
end