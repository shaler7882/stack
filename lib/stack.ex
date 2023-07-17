defmodule Stack do
  use GenServer

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_cast({:minus, new_state}, state) do
    new_state = state - new_state
    {:noreply, new_state}
  end

  @impl true
  def handle_cast({:add, new_state}, state) do
    new_state = state + new_state
    {:noreply, new_state}
  end


  def start_link(state) do
    GenServer.start_link(__MODULE__, state)
  end


  def pop(pid, value) do
    GenServer.cast(pid, {:minus, value})
  end

  def push(pid, value) do
    GenServer.cast(pid, {:add, value})
  end
end
