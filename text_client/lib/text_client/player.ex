defmodule TextClient.Player do

  alias TextClient.{State, Summary, Prompter}

  #won, lost, good guess, bad guess, already used, initializing
  def play(%State{tally: %{game_state: :won}}) do
    exit_with_message("You Won!")
  end

  def play(%State{tally: %{game_state: :lost}}) do
    exit_with_message("You Lost!")
  end

  def play(game = %State{tally: %{game_state: :good_guess}}) do
    continue_with_message(game, "Correct! Good guess!")
  end

  def play(game = %State{tally: %{game_state: :bad_guess}}) do
    continue_with_message(game, "Nope! Try again!")
  end

  def play(game = %State{tally: %{game_state: :already_used}}) do
    continue_with_message(game, "You've already used this letter.")
  end

  def play(game) do
    continue(game)
  end

  def continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end

  def display(game) do
    game
  end

  def prompt(game) do
    game
  end

  def make_move(game) do
    game
  end

  def continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> make_move()
    |> play()
  end

  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end

end
