defmodule ExTrails.V1.Domain.DomainTest do
  use ExUnit.Case, async: true

  alias ExTrails.V1.Client
  alias ExTrails.V1.Domain

  setup_all do
    %{client: %Client{}}
  end

  describe "The domain module returns responses" do
    test "the domain information yields results", %{client: client} do
      Domain.info(client, "mocked.com")
    end

    test "the domain sudomains yields results", %{client: client} do
      Domain.subdomains(client, "mocked.com")
    end

    test "the domain tags yields results", %{client: client} do
      Domain.tags(client, "mocked.com")
    end
  end
end
