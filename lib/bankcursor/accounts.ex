defmodule Bankcursor.Accounts do
    alias Bankcursor.Accounts.Create

    defdelegate create(params), to: Create, as: :call
end
