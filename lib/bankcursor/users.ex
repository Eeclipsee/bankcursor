defmodule Bankcursor.Users do

    alias Bankcursor.Users.Create
    alias Bankcursor.Users.Delete
    alias Bankcursor.Users.Get
    alias Bankcursor.Users.Update
    alias Bankcursor.Users.Verify


    defdelegate create(params), to: Create, as: :call
    defdelegate delete(id), to: Delete, as: :call
    defdelegate get(id), to: Get, as: :call
    defdelegate update(params), to: Update, as: :call
    defdelegate login(params), to: Verify, as: :call

end
