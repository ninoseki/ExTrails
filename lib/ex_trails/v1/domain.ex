defmodule ExTrails.V1.Domain do
  import ExTrails
  alias ExTrails.V1.Client

  def info(%Client{} = client, hostname) do
    req_get(client, "/domain/#{hostname}", ExTrails.V1.Domain.DomainInfo)
  end
end
