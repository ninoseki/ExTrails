defmodule ExTrails.V1.Domain.Subdomains do
  defstruct [
    :subdomains,
    :endpoint
  ]

  alias __MODULE__

  def parse(%Subdomains{} = subdomains) do
    subdomains
  end
end
