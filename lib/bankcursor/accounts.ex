defmodule Bankcursor.Accounts do
    alias Bankcursor.Accounts.Create
    alias Bankcursor.Accounts.Transaction

    defdelegate create(params), to: Create, as: :call
    defdelegate transaction(from_account, to_account, value), to: Transaction, as: :call

end
