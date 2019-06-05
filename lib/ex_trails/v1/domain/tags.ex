defmodule ExTrails.V1.Domain.Tags do
  defstruct [
    :tags,
    :endpoint
  ]

  alias __MODULE__

  def parse(%Tags{} = tags), do: tags
end
