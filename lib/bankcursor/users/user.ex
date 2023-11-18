defmodule Bankcursor.Users.User do
    use Ecto.Schema
    import Ecto.Changeset
    alias Ecto.Changeset


    schema "users" do
        field :name, :string
        field :password, :string, virtual: true
        field :password_hash, :string 
        field :email, :string
        field :cep, :string

        timestamps()
    end


    def changeset(user \\ %__MODULE__{}, params) do
        user
        |> cast(params, [:name, :password, :email, :cep])
        |> validate_required([:name, :password, :email, :cep])
        |> validate_length(:name, min: 3)
        |> validate_format(:email, ~r/@/)
        |> validate_length(:cep, is: 8)
        |> add_password_hash()
    end

    defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
        change(changeset, Pbkdf2.add_hash(password))
    end

    defp add_password_hash(changeset), do: changeset

end