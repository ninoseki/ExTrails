defmodule ExTrails.V1.Client do
  @moduledoc """
  A client used to the securitytrails interaction
  """
  use HTTPoison.Base

  defstruct endpoint: "api.securitytrails.com/v1"

  @type t :: %ExTrails.V1.Client{endpoint: url}

  alias __MODULE__

  @doc """
  Returns a new client for working with the Securitytrails v1 Api

  ## Example

    iex> ExTrails.V1.Client.new
    %ExTrails.V1.Client{endpoint: "api.securitytrails.com/v1"}

  """
  @spec new() :: ExTrails.V1.Client.t()
  def new do
    %Client{}
  end
end
