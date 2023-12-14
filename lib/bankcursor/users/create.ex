defmodule Bankcursor.Users.Create do
    alias Bankcursor.Users.User
    alias Bankcursor.Repo
    alias Bankcursor.ViaCep.Client

    def call(%{"cep" => cep} = params) do
        with {:ok, _result} <- Client.call(cep) do
            params
            |> User.changeset()
            |> Repo.insert()
        end
    end
end
