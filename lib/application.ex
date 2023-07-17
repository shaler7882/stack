defmodule Stack.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Stack, []}
    ]

    {:ok, supervisor_pid} = Supervisor.start_link(children, strategy: :one_for_one)
  end
end
