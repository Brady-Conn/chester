defmodule Chester.Repo do
  use Ecto.Repo,
    otp_app: :chester,
    adapter: Ecto.Adapters.Postgres
end
