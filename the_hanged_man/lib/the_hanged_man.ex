defmodule TheHangedMan do

  alias TheHangedMan.Game

  defdelegate new_game(), to: Game

end
