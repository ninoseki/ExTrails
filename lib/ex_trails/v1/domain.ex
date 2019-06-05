defmodule ExTrails.V1.Domain do
  import ExTrails
  alias ExTrails.V1.Client
  alias ExTrails.V1.Domain.DomainInfo
  alias ExTrails.V1.Domain.Subdomains
  alias ExTrails.V1.Domain.Tags

  @doc """
  Wrapper function for: https://api.securitytrails.com/v1/domain/(hostname)

  Returns the DNS records associated with the hostname.
  See documentation at https://docs.securitytrails.com/v1.0/reference#get-domain
  """
  def info(%Client{} = client, hostname) do
    req_get(client, "/domain/#{hostname}", DomainInfo)
  end

  @doc """
  Wrapper function for: https://api.securitytrails.com/v1/domain/(hostname)/subdomains

  Returns the first 2000 domains of a given hostname as a list.
  See documentation at https://docs.securitytrails.com/v1.0/reference#list-subdomains
  """
  def subdomains(%Client{} = client, hostname) do
    req_get(client, "/domain/#{hostname}/subdomains", Subdomains)
  end

  @doc """
  Wraper function for: https://api.securitytrails.com/v1/domain/(hostname)/tags

  Return the tags for a given hostname in a list.
  See documentation at https://docs.securitytrails.com/v1.0/reference#list-tags
  """
  def tags(%Client{} = client, hostname) do
    req_get(client, "/domain/#{hostname}/tags", Tags)
  end
end
