defmodule Bankcursor.Accounts.Create do
    alias Bankcursor.Accounts.Account
    alias Bankcursor.Repo

    def call(params) do
      params
      |> Account.changeset()
      |> Repo.insert()
    end
end
