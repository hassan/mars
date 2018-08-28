defmodule Mars.Commander do
  def move(pid) do
    GenServer.cast(pid, {:instruct, "M"})
  end

  def turn(pid, direction) do
    GenServer.cast(pid, {:instruct, direction})
  end

  def locate(pid) do
    GenServer.call(pid, :locate)
  end
end
