defmodule Bankcursor.Users.Delete do
  alias Bankcursor.Users.User
  alias Bankcursor.Repo

  def call(params) do
      params
      |> User.changeset()
      |> Repo.insert()
  end
end
