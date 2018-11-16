defmodule ExTrails.V1.Domain do
  import ExTrails
  alias ExTrails.V1.Client

  @doc """
  Wrapper function for: https://api.securitytrails.com/v1/domain/(hostname)
  """
  def info(%Client{} = client, hostname) do
    req_get(client, "/domain/#{hostname}", ExTrails.V1.Domain.DomainInfo)
  end
end
