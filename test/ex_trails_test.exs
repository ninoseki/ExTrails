defmodule ExTrailsTest do
  use ExUnit.Case, async: true
  doctest ExTrails

  alias ExTrails.V1.Client
  alias ExTrails.V1.Error

  describe "req function works as usual" do
    test "function fails in anything other then test with failed authroization due to missing api key" do
      client = Client.new()

      assert %Error{status: status, message: message} = ExTrails.req(client, "get", "/ping", nil, :anything)
    end
  end
end
