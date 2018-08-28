defmodule RoverTest do
  use ExUnit.Case

  test "moves north" do
    position = %{x: 2, y: 2, dir: :north}
    assert Mars.Rover.move(position) == %{x: 2, y: 3, dir: :north}
  end

  test "moves south" do
    position = %{x: 2, y: 2, dir: :south}
    assert Mars.Rover.move(position) == %{x: 2, y: 1, dir: :south}
  end

  test "moves west" do
    position = %{x: 2, y: 2, dir: :west}
    assert Mars.Rover.move(position) == %{x: 1, y: 2, dir: :west}
  end

  test "moves east" do
    position = %{x: 2, y: 2, dir: :east}
    assert Mars.Rover.move(position) == %{x: 3, y: 2, dir: :east}
  end

  test "faces west after turning left while facing north" do
    position = %{x: 2, y: 2, dir: :north}
    assert Mars.Rover.turn(position, "L") == %{x: 2, y: 2, dir: :west}
  end

  test "faces east after turning right while facing north" do
    position = %{x: 2, y: 2, dir: :north}
    assert Mars.Rover.turn(position, "R") == %{x: 2, y: 2, dir: :east}
  end

  test "faces north after turning left and right while facing north" do
    position = %{x: 2, y: 2, dir: :north}
    assert Mars.Rover.instruct(position, "LR") == %{x: 2, y: 2, dir: :north}
  end

  test "makes multiple turns" do
    position = %{x: 1, y: 2, dir: :north}
    assert Mars.Rover.instruct(position, "LMLMLMLMM") == %{x: 1, y: 3, dir: :north}
  end
end
