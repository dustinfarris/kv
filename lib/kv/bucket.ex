defmodule KV.Bucket do

  @doc """
  Start a new bucket.
  """
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Get a value from the `bucket` by `key`.
  """
  def get(agent, key) do
    Agent.get(agent, &Map.get(&1, key))
  end

  @doc """
  Put the `value` for the given `key` in the `bucket`.
  """
  def put(agent, key, value) do
    Agent.update(agent, &Map.put(&1, key, value))
  end

  @doc """
  Delete `key` from `bucket`

  Return the current value of `key` if it exists.
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
