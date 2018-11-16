defmodule ExTrails.Configuration do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def config do
    GenServer.call(__MODULE__, :get) |> Enum.into(%{})
  end

  # Server (callbacks)

  @impl true
  def init(_) do
    config = Application.get_all_env(:ex_trails)
    {:ok, config}
  end

  @impl true
  def handle_call(:get, _, state) do
    {:reply, state, state}
  end
end
