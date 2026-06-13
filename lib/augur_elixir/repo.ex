defmodule AugurElixir.Repo do
  use Ecto.Repo,
    otp_app: :augur_elixir,
    adapter: Ecto.Adapters.Postgres
end
