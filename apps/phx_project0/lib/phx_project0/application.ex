defmodule PhxProject0.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxProject0.PubSub},
      # Start Finch
      {Finch, name: PhxProject0.Finch}
      # Start a worker by calling: PhxProject0.Worker.start_link(arg)
      # {PhxProject0.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: PhxProject0.Supervisor)
  end
end
