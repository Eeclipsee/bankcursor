defmodule Bankcursor.Repo do
  use Ecto.Repo,
    otp_app: :bankcursor,
    adapter: Ecto.Adapters.Postgres
end
