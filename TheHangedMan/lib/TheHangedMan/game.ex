defmodule TheHangedMan.Game do

  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new()
  )

  def new_game() do
    %TheHangedMan.Game{
      letters: Dictionary.random_word |> String.codepoints
    }
  end

  def make_move(game = %{game_state: state}, _guess) when state in [:won, :lost] do
    {game, tally(game)}
  end

  def make_move(game, guess) do
    accept_move(game, guess, MapSet.member?(game.used, guess))
    {game, tally(game)}
  end

  def accept_move(game, guess, _already_guessed = true) do
    Map.put(game, :game_state, :already_used)
  end

  def tally(game) do

  end

end
