defmodule Dictionary do
  @moduledoc """
  Documentation for `Dictionary`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Dictionary.hello()


  """
  def random_word() do
    Enum.random(word_list())
  end

  def word_list do
    "../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end

end
