defmodule GameTest do
  use ExUnit.Case

  alias TheHangedMan.Game

  test "new_game returns struct" do
    game = Game.new_game()
    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "state isn't changed for :won or :lost game" do
    for state <- [:won, :lost] do
      game = Game.new_game() |> Map.put(:game_state, state)
      assert ^{game, _} = Game.make_move(game, "x")
    end
  end

  test "first occurrence of letter is not already used" do
    game = Game.new_game()
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state != :already_used
  end

  test "second occurrence of letter is not already used" do
    game = Game.new_game()
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state != :already_used
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end

  test "a good guess is recognized" do
    game = Game.new_game("cats")
    {game, _tally} = Game.make_move(game, "c")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
  end

  test "a guessed word is a won game" do
    game = Game.new_game("cats")
    {game, _tally} = Game.make_move(game, "c")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    {game, _tally} = Game.make_move(game, "a")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    {game, _tally} = Game.make_move(game, "t")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    {game, _tally} = Game.make_move(game, "s")
    assert game.game_state == :won
    assert game.turns_left == 7
  end

  test "bad guess is recognized" do
    game = Game.new_game("cats")
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
  end


end
