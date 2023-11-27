defmodule Bankcursor.Users do

    alias Bankcursor.Users.Create
    alias Bankcursor.Users.Get
    alias Bankcursor.Users.Update


    defdelegate create(params), to: Create, as: :call
    defdelegate get(id), to: Get, as: :call
    defdelegate update(params), to: Update, as: :call
end
