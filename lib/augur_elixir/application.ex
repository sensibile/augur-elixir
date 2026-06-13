defmodule AugurElixir.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AugurElixirWeb.Telemetry,
      AugurElixir.Repo,
      {DNSCluster, query: Application.get_env(:augur_elixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AugurElixir.PubSub},
      # Start a worker by calling: AugurElixir.Worker.start_link(arg)
      # {AugurElixir.Worker, arg},
      # Start to serve requests, typically the last entry
      AugurElixirWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AugurElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AugurElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
