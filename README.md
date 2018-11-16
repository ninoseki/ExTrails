# ExTrails

Simple Elixir wrapper for the [SecurityTrails API](https://securitytrails.com/).

Elixir + SecurityTrails = ExTrails

## Installation

  1. Add ExTrails to your list of dependencies in `mix.exs`:
  ```Elixir
  def deps do
    [{:ex_trails, "~> 0.1.0}]
  end
  ```

  2. Pass in your API credentials via the mix configuration:
  ```Elixir
  config :ex_trails,
    api_key: "YOUR_API_KEY_HERE"
  ```

  Or, via an ENV var:
  ```bash
  export SCT_API_KEY="YOUR_API_KEY_HERE"
  ```

## Usage

The ExTrails is a really dead simple API wrapper for SecurityTrails API. It wraps all the categories into modules. So for example, you may find the domain information endpoint inside `ExTrails.V1.Domain.info/2` function. 

Keep in mind though that the first parameter to **every** wrapper function is gonna be the `Client` struct, which can easly be created ( disscussed below ).

