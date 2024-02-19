defmodule Bankcursor.Users.Create do
    alias Bankcursor.Users.User
    alias Bankcursor.Repo
    alias Bankcursor.ViaCep.Client, as: ViaCepClient

    def call(%{"cep" => cep} = params) do
        with {:ok, _result} <- client().call(cep) do
            params
            |> User.changeset()
            |> Repo.insert()
        end
    end

    defp client() do
      Application.get_env(:bankcursor, :via_cep_client, ViaCepClient)
    end
end
