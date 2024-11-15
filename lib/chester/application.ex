defmodule Chester.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ChesterWeb.Telemetry,
      Chester.Repo,
      {DNSCluster, query: Application.get_env(:chester, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Chester.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Chester.Finch},
      # Start a worker by calling: Chester.Worker.start_link(arg)
      # {Chester.Worker, arg},
      # Start to serve requests, typically the last entry
      ChesterWeb.Endpoint,
      Chester.Engine
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chester.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChesterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
