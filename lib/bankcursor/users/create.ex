defmodule Bankcursor.Users.Create do
    alias Bankcursor.Users.User
    alias Bankcursor.Repo
    alias Bankcursor.ViaCep.Client, as: ViaCepClient

    def call(%{"cep" => cep} = params) do
        with {:ok, _result} <- ViaCepClient.call(cep) do
            params
            |> User.changeset()
            |> Repo.insert()
        end
    end
end
