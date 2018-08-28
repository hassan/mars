defmodule Mars.Plateau do
  use GenServer

  def init(boundary) do
    {:ok, boundary}
  end

  def handle_call(:locate, _from, boundary) do
    {:reply, boundary, boundary}
  end
end
