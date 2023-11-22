defmodule Bankcursor.UsersJson do
    def create(%{user: user}) do
        %{
            message: "User criado com sucesso!",
            id: user.id,
            cep: user.cep,
            email: user.email
        }
    end
end