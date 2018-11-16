defmodule ExTrails.ConfigurationTest do
  use ExUnit.Case, async: true

  alias ExTrails.Configuration

  describe "The configuration behaves normally" do
    test "It gives the api key" do
      assert %{api_key: _} = Configuration.config()
    end
  end
end
