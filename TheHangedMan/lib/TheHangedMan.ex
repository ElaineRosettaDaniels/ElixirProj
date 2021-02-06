defmodule TheHangedMan do

  alias TheHangedMan.Game

  def new_game() do
      TheHangedMan.Server.start_link()
  end

  def make_move(game_pid, guess) do
      GenServer.call(game_pid, {:tally})
  end

  def make_move(game_pid, guess) do
      GenServer.call(game_pid, {:make_move, guess})
  end

end
