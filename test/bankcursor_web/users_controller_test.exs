defmodule BankcursorWeb.UsersControllerTest do
  use BankcursorWeb.ConnCase

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do

      params = %{
        name: "João",
        password: "123455",
        email: "teste@teste",
        cep: "12345636"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
                "data" => %{"cep" => "12345636", "email" => "teste@teste", "id" => _id, "name" => "João",},
                "message" => "User criado com sucesso"
              } = response

    end
  end
end
