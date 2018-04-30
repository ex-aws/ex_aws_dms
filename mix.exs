defmodule ExAws.DMS.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :ex_aws_dms,
      version: @version,
      elixir: "~> 1.6",
      deps: deps(),
      start_permanent: Mix.env() == :prod
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:hackney, ">= 0.0.0", only: [:dev, :test]},
      {:sweet_xml, ">= 0.0.0", only: [:dev, :test]},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      {:ex_aws, "~> 2.0.0"}
    ]
  end
end
