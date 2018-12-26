defmodule ExTrails.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_trails,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],

      # Docs
      name: "ExTrails",
      source_url: "https://github.com/dev-cyprium/ExTrails",
      homepage_url: "https://securitytrails.com/",
      docs: [
        main: "ExTrails",
        extras: ["README.md"]
      ],
      package: package(),
      description: description(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ExTrails.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:jason, "~> 1.1"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:inch_ex, only: :docs}
    ]
  end

  defp description do
    "A simple wrapper package for SecurityTrails API"
  end

  defp package do
    %{
      name: "ex_trails",
      licenses: ["MIT"],
      links: %{
        "GitHub": "https://github.com/dev-cyprium/ExTrails",
        "Site": "https://securitytrails.com/",
        "Api": "https://api.securitytrails.com/",
        "Docs": "https://docs.securitytrails.com/"
      }
    }
  end
end
