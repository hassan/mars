defmodule EtsUtility do
  @moduledoc """
    Utility functions for ETS
  """

  def create_table(table) do
    case :ets.info(table) do
      :undefined -> :ets.new(table, [:named_table, :set, :public])
      _ -> table
    end
  end

  def replace(table) do
    :ets.delete(table)
    create_table(table)
  end

  def insert(table, thing) do
    :ets.insert(table, thing)
  end

  def keys(table) do
    first = :ets.first(table)

    case first do
      :"$end_of_table" -> []
      _ -> keys(table, first, [first])
    end
  end

  def keys(table, next, acc) do
    forward = :ets.next(table, next)

    case forward do
      :"$end_of_table" -> acc
      _ -> keys(table, forward, [forward | acc])
    end
  end
end
