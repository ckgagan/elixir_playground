defmodule MapStore do
  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def get_value(key_store, key) do
    Agent.get(__MODULE__, fn(store) -> Map.get(store, key_store) |> Map.get(key) end)
  end

  def get_value(key_store) do
    Agent.get(__MODULE__, fn(store) -> Map.get(store, key_store) end)
  end

  def set_value(key_store, key, value) do
    Agent.update(__MODULE__, fn store ->
      top_store = Map.get(store, key_store, %{})
      updated_top_store = Map.put(top_store, key, value)
      Map.put(store, key_store, updated_top_store)
    end)
  end
end
