defmodule Mars.Commander do
  def launch(landing_zone \\ %{dir: :north, x: 0, y: 0}) do
    children = [
      %{id: Historian, start: {Mars.Historian, :start_link, [%{}]}},
      %{id: Rover, start: {Mars.Rover, :start_link, [landing_zone]}}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def move(pid) do
    GenServer.cast(pid, {:instruct, "M"})
  end

  def turn(pid, direction) do
    GenServer.cast(pid, {:instruct, direction})
  end

  def locate(pid) do
    GenServer.call(pid, :locate)
  end

  def current(pid) do
    GenServer.call(pid, :current)
  end
end
