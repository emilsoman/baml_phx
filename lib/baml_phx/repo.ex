defmodule BamlPhx.Repo do
  use Ecto.Repo,
    otp_app: :baml_phx,
    adapter: Ecto.Adapters.Postgres
end
