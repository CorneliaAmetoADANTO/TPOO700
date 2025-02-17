defmodule ProjetTpoo700.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ProjetTpoo700Web.Telemetry,
      ProjetTpoo700.Repo,
      {DNSCluster, query: Application.get_env(:projet_tpoo700, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ProjetTpoo700.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ProjetTpoo700.Finch},
      # Start a worker by calling: ProjetTpoo700.Worker.start_link(arg)
      # {ProjetTpoo700.Worker, arg},
      # Start to serve requests, typically the last entry
      ProjetTpoo700Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ProjetTpoo700.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ProjetTpoo700Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
