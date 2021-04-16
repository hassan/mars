defmodule Mars.Historian do
  use GenServer
  require EtsUtility

  @moduledoc false

  def start_link(position) do
    GenServer.start_link(__MODULE__, position, name: Historian)
  end

  def init(position) do
    EtsUtility.create_table(:history)
    EtsUtility.insert(:history, {:trail, [position | past_positions()]})
    {:ok, position}
  end

  def handle_call(:current, _from, position) do
    {:reply, position, position}
  end

  def handle_call(:trail, _from, position) do
    {:reply, past_positions(), position}
  end

  def handle_cast({:update, new_position}, _position) do
    EtsUtility.insert(:history, {:trail, [new_position | past_positions()]})
    {:noreply, new_position}
  end

  defp past_positions() do
    trail = :ets.lookup(:history, :trail)

    case trail do
      [] -> []
      _ -> List.first(trail) |> elem(1)
    end
  end
end
