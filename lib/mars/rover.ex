defmodule Mars.Rover do
  use GenServer

  def start_link(position) do
    GenServer.start_link(__MODULE__, position, name: Rover)
  end

  def init(position) do
    {:ok, position}
  end

  def handle_call(:locate, _from, position) do
    {:reply, position, position}
  end

  def handle_cast({:instruct, commands}, position) do
    {:noreply, instruct(position, commands)}
  end

  def instruct(position, commands) when commands == "" do
    position
  end

  def instruct(position, commands) do
    [hd | tl] = String.split(commands, "", trim: true)

    new_position =
      case hd do
        "M" -> move(position)
        "L" -> turn(position, "L")
        "R" -> turn(position, "R")
        _ -> position
      end

    instruct(new_position, Enum.join(tl, ""))
  end

  def move(position) do
    case position do
      %{x: x, y: y, dir: :north} -> %{x: x, y: y + 1, dir: :north}
      %{x: x, y: y, dir: :south} -> %{x: x, y: y - 1, dir: :south}
      %{x: x, y: y, dir: :west} -> %{x: x - 1, y: y, dir: :west}
      %{x: x, y: y, dir: :east} -> %{x: x + 1, y: y, dir: :east}
      _ -> position
    end
  end

  def turn(position, command) do
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
      _ -> position
    end
  end
end
