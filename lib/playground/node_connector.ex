# lib/my_app/node_connector.ex

defmodule Playground.NodeConnector do
  @moduledoc """
  Automatically connects to nodes in the cluster on application startup.
  """

  def connect_nodes do
    nodes = Application.get_env(:playground, :nodes, [])

    Enum.each(nodes, fn node ->
      case Node.ping(node) do
        :pong -> IO.puts("Successfully connected to #{node}")
        :pang -> IO.puts("Failed to connect to #{node}")
      end
    end)
  end
end
