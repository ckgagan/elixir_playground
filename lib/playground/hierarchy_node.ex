defmodule Playground.HierarchyNode do

  def build_tree do
    node_list = %{}
    Enum.map(db_nodes(), fn node -> Map.put(node_list, node.id, NaryTree.Node.new(node.path)) end)
    build_tree(node_list, NaryTree.new(NaryTree.Node.new("Root")))
  end

  def build_tree([head | tail], tree) do
    String.split(head.path, ".")
    build_tree(tail, tree)
  end

  def build_tree([], tree) do
    tree
  end

  def db_nodes do
    [
      %{id: 2, path: "child1"},
      %{id: 3, path: "child2"},
      %{id: 4, path: "child1.1"},
      %{id: 5, path: "child1.2"},
      %{id: 6, path: "child2.1"},
      %{id: 7, path: "child2.2"},
      %{id: 8, path: "child1.1.1"},
      %{id: 9, path: "child1.1.2"},
      %{id: 10, path: "child1.2.1"},
      %{id: 11, path: "child1.2.2"},
      %{id: 12, path: "child2.1.1"},
      %{id: 13, path: "child2.1.2"},
      %{id: 14, path: "child2.2.1"},
      %{id: 15, path: "child2.2.2"},
      %{id: 16, path: "child1.1.1.1"},
      %{id: 17, path: "child1.1.1.2"},
      %{id: 18, path: "child1.1.2.1"},
      %{id: 19, path: "child1.1.2.2"},
      %{id: 20, path: "child1.2.1.1"},
      %{id: 21, path: "child1.2.1.2"},
      %{id: 22, path: "child1.2.2.1"},
    ]
  end
end
