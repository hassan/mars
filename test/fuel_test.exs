defmodule Mars.FuelTest do
  @moduledoc false

  use ExUnit.Case

  @doc """
    For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2.
    For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2.
    For a mass of 1969, the fuel required is 654.
    For a mass of 100756, the fuel required is 33583.
  """

  test "returns 0 for 0" do
    assert Mars.Fuel.calculate(0) == 0
  end

  test "returns at least 1 for non-zero mass" do
    assert Mars.Fuel.calculate(1) == 1
    assert Mars.Fuel.calculate(8) == 1
    assert Mars.Fuel.calculate(9) == 1
  end

  test "returns 2 for mass of 12 or 14" do
    assert Mars.Fuel.calculate(12) == 2
    assert Mars.Fuel.calculate(14) == 2
  end

  test "returns 654 for mass of 1969" do
    assert Mars.Fuel.calculate(1969) == 654
  end

  test "returns 33583 for mass of 100756" do
    assert Mars.Fuel.calculate(100_756) == 33_583
  end

  test "returns 4 for masses of 12 and 14" do
    assert Mars.Fuel.calculate([12, 14]) == 4
  end
end
