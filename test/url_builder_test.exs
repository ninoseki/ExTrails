defmodule ExTrails.UrlBuilderTest do
  use ExUnit.Case, async: true

  alias ExTrails.UrlBuilder
  alias ExTrails.V1.Client

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
end
