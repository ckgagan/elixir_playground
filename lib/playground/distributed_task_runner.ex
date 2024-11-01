defmodule Playground.DistributedTaskRunner do
  @nodes Application.get_env(:playground, :nodes, [])

  def run_tasks_concurrently do
    tasks = 1..1000

    # Split tasks into chunks to distribute evenly across nodes
    chunked_tasks = Enum.chunk_every(tasks, div(Enum.count(tasks), Enum.count(@nodes)))

    # For each node, distribute its chunk of tasks
    Enum.map(@nodes, fn node ->
      Task.Supervisor.async_stream_nolink(
        {Task.Supervisor, node},  # Use Task.Supervisor running on remote node
        Enum.at(chunked_tasks, Enum.find_index(@nodes, &(&1 == node))),
        fn task_id -> perform_task(task_id) end,
        max_concurrency: System.schedulers_online()
      )
    end)
    |> Enum.flat_map(&Enum.to_list/1)  # Collect results from all nodes
  end

  def perform_task(task_id) do
    # Simulate a task (e.g., make a calculation, call an external API, etc.)
    IO.puts("This is random number #{:rand.uniform(1000)}")
    {:ok, task_id}
  end

end
