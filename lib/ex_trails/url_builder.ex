defmodule ExTrails.UrlBuilder do
  @doc """
  Module used to build urls for the SecurityTrails API
  """
  alias ExTrails.V1.Client
  alias ExTrails.Configuration

  @user_agent "Elixir (ExTrails)"

  def make_url(%Client{endpoint: endpoint}, path) do
    endpoint <> path
  end

  def default_headers do

    api_key = Configuration.config()[:api_key]
    if api_key == nil do
      raise "Major Error! Application key is not configured. Please provide the api_key in one of the ways described in the documentation."
    end
    [
      {"APIKEY", api_key},
      {"User-Agent", @user_agent}
    ]
  end
end
