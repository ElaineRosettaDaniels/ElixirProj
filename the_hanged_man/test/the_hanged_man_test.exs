defmodule TheHangedManTest do
  use ExUnit.Case
  doctest TheHangedMan

  test "greets the world" do
    assert TheHangedMan.hello() == :world
  end
end
