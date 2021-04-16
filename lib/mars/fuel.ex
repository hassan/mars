defmodule Mars.Fuel do
  @moduledoc false

  def calculate(masses, total \\ 0)

  def calculate([], total), do: total

  def calculate(masses, total) when is_list(masses) do
    calculate(tl(masses), calculate(hd(masses)) + total)
  end

  def calculate(mass, _) do
    cond do
      mass == 0 -> 0
      mass <= 8 -> 1
      true -> (mass / 3 - 2) |> Float.floor()
    end
  end
end
