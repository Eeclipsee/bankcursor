defmodule Bankcursor.Users.Create do
    alias Bankcursor.Users.User
    alias Bankcursor.Repo

    def call(params) do
        params
        |> User.changeset()
        |> Repo.insert()
    end 
end
