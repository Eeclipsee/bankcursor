defmodule BankcursorWeb.UsersJSON do
    alias Bankcursor.Users.User
    
    def create(%{user: user}) do 
        %{
            message: "User criado com sucesso",
            data: data(user)
        }
    end

    defp data(%User{} = user) do
        %{
            id: user.id,
            cep: user.cep,
            email: user.email,
            name: user.name 
        }
    end
end