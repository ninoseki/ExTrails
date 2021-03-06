[![Build Status](https://travis-ci.com/dev-cyprium/ExTrails.svg?branch=master)](https://travis-ci.com/dev-cyprium/ExTrails)
[![Coverage Status](https://coveralls.io/repos/github/dev-cyprium/ExTrails/badge.svg?branch=master)](https://coveralls.io/github/dev-cyprium/ExTrails?branch=master)
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

The ExTrails is a really simple API wrapper for SecurityTrails API. It wraps all the categories into modules. So for example, you may find the domain information endpoint inside `ExTrails.V1.Domain.info/2` function. 

Keep in mind though that the first parameter to **every** wrapper function is gonna be the `Client` struct, which can easly be created ( disscussed below ).

## Licence
MIT License

Copyright (c) 2018 Stefan Kupresak

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

