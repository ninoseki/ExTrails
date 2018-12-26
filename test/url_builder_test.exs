defmodule ExTrails.UrlBuilderTest do
  use ExUnit.Case, async: false

  alias ExTrails.UrlBuilder
  alias ExTrails.Configuration
  alias ExTrails.V1.Client

  setup_all do
    old = Application.get_env(:ex_trails, :api_key)
    Application.put_env(:ex_trails, :api_key, nil)
    Configuration.reconfigure()
    on_exit(fn ->
      Application.put_env(:ex_trails, :api_key, old)
      Configuration.reconfigure()
    end)
  end

  describe "Url builds urls as expected" do
    test "Given a client and a path it gieves the proper URL" do
      client = Client.new
      url = UrlBuilder.make_url(client, "/some/path/example")

      assert url =~ "api.securitytrails.com/v1"
    end

    test "Has no path given no path" do
      client = Client.new
      url = UrlBuilder.make_url(client, "")

      assert url =~ "api.securitytrails.com"
    end
  end

  describe "Headers function properly" do
    test "Will rise error if api key isn't configured properly" do
      assert_raise RuntimeError, ~r/Major Error\!/, fn ->
        _ = UrlBuilder.default_headers()
      end
    end
  end
end
