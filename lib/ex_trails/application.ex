defmodule ExTrails.Application do
  use Application

  def start(_, _) do
    children = [
      ExTrails.Configuration
    ]

    opts = [strategy: :one_for_one, name: ExTrails.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
