defmodule ExTrails.V1.Error do
  @doc """
  Used to wrap the errors that the SecurityTrails API
  may return
  """

  defstruct [:status, :message, :body]
end
