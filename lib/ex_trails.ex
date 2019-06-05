defmodule ExTrails do
  @moduledoc """
  Application ExTrails is an api client for SecurityTrails that can be
  both used as a standalone CLI or an Elixir application client
  """
  @env Mix.env()

  alias ExTrails.V1.Client
  alias ExTrails.V1.Error
  alias ExTrails.UrlBuilder

  @doc """
  Get request used by the library.

  Using the generic request function, we make a get request against
  a given path. This function can be used as a standalone function to
  get a path, and is used by the library to build the actual wrappers for API.
  """
  @spec req_get(ExTrails.V1.Client.t(), binary(), module()) :: ExTrails.V1.Error.t()
  def req_get(%Client{} = client, path, module) do
    req(client, :get, path, module)
  end

  @doc """
  Generic method for making API requests using a client to SecurityTrails API
  """
  def req(client, type, path, module, env \\ @env)
  def req(_, _, _, module, :test) do
    _parse_response(%{status_code: 200, body: ExTrails.Mocks.get_mock(module)}, module)
  end
  def req(%Client{} = client, type, path, module, _) do
    url = UrlBuilder.make_url(client, path)
    headers = UrlBuilder.default_headers()

    case Client.request(type, url, "", headers) do
      {:ok, response} -> _parse_response(response, module)
    end
  end

  defp _parse_response(%{status_code: ok, body: body}, module) when ok in 200..299 do
    data =
      Jason.decode!(body)
      |> Enum.map(fn {key, val} -> {String.to_existing_atom(key), val} end)
      |> Enum.into(%{})

    module
    |> struct!(data)
    |> module.parse
  end
  defp _parse_response(%{status_code: err, body: body}, _) do
    case Jason.decode!(body) do
      %{"message" => message} -> %Error{message: message, status: err}
    end
  end
end
