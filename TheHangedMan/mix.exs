defmodule TheHangedMan.MixProject do
  use Mix.Project

  def project do
    [
      app: :the_hanged_man,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {TheHangedMan.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :dictionary, path: "../dictionary"},
    ]
  end
end
