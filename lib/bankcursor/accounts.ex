defmodule Bankcursor.Accounts do
    alias Bankcursor.Accounts.Create
    alias Bankcursor.Accounts.Transaction

    defdelegate create(params), to: Create, as: :call
    defdelegate transaction(params), to: Transaction, as: :call

end
