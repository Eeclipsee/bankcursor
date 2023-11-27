defmodule Bankcursor.Users.Update do
  alias Bankcursor.Users.User
  alias Bankcursor.Repo

  def call(%{"id" => id} = params) do
      case Repo.get(User, id) do
          nil -> {:error, :not_found}
          user -> update(user, params)
      end
  end

  defp update(user, params)
    user
    |> User.Changeset(params)
    |> Repo.update()
end
