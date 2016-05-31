defmodule XmlrpcClient.Mixfile do
  use Mix.Project

  def project do
    [app: :xmlrpc_client,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     preferred_cli_env: [espec: :test]]
  end

  def application do
    [applications: [:logger, :httpotion]]
  end

  defp deps do
    [
      {:httpotion, "~> 2.2.0"},             # manage http requests
      {:espec, "~> 0.8.21", only: :test}    # test framwork
    ]
  end
end
