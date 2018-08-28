defmodule Mars.Rover do
  def instruct(plateau, position, commands) when commands == "" do
    position
  end

  def instruct(plateau, position, commands) do
    [hd | tl] = String.split(commands, "", trim: true)

    new_position =
      case hd do
        "M" -> move(plateau, position)
        "L" -> turn(plateau, position, "L")
        "R" -> turn(plateau, position, "R")
      end

    instruct(plateau, new_position, Enum.join(tl, ""))
  end

  def move(plateau, position) do
    case position do
      %{x: x, y: y, dir: :north} -> %{x: x, y: y + 1, dir: :north}
      %{x: x, y: y, dir: :south} -> %{x: x, y: y - 1, dir: :south}
      %{x: x, y: y, dir: :west} -> %{x: x - 1, y: y, dir: :west}
      %{x: x, y: y, dir: :east} -> %{x: x + 1, y: y, dir: :east}
      _ -> position
    end
  end

  def turn(plateau, position, command) do
    position_change = Map.put_new(position, :cmd, command)

    case position_change do
      %{x: _, y: _, dir: :north, cmd: "L"} -> %{position | dir: :west}
      %{x: _, y: _, dir: :west, cmd: "L"} -> %{position | dir: :south}
      %{x: _, y: _, dir: :south, cmd: "L"} -> %{position | dir: :east}
      %{x: _, y: _, dir: :east, cmd: "L"} -> %{position | dir: :north}
      %{x: _, y: _, dir: :north, cmd: "R"} -> %{position | dir: :east}
      %{x: _, y: _, dir: :east, cmd: "R"} -> %{position | dir: :south}
      %{x: _, y: _, dir: :south, cmd: "R"} -> %{position | dir: :west}
      %{x: _, y: _, dir: :west, cmd: "R"} -> %{position | dir: :north}
    end
  end
end
