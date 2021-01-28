defmodule TextClient.Interact do

  alias TextClient.{State, Player}


  def start() do
      TheHangedMan.new_game()
      |> setup_state()
      |> Player.play()
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally: TheHangedMan.tally(game)
    }
  end


end
