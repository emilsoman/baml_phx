defmodule BamlPhx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BamlPhxWeb.Telemetry,
      BamlPhx.Repo,
      {DNSCluster, query: Application.get_env(:baml_phx, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BamlPhx.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BamlPhx.Finch},
      # Start a worker by calling: BamlPhx.Worker.start_link(arg)
      # {BamlPhx.Worker, arg},
      # Start to serve requests, typically the last entry
      BamlPhxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BamlPhx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BamlPhxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
