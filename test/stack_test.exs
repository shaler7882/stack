defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  test "start_link/1 - default state" do
    old_tuple = {:ok, pid} = Stack.start_link(2)
    new_tuple = Tuple.to_list(old_tuple)
    assert hd(new_tuple) == :ok
  end

  test "pop/1 - remove one element from stack" do
    {:ok, pid} = Stack.start_link(2)
    Stack.pop(pid, 1)
    assert :sys.get_state(pid) == 1
  end

  test "pop/1 - remove multiple elements from stack" do
    {:ok, pid} = Stack.start_link(10)
    Stack.pop(pid, 1)
    Stack.pop(pid, 1)
    Stack.pop(pid, 1)
    assert :sys.get_state(pid) == 7
  end

  test "pop/1 - remove element from empty stack" do
    {:ok, pid} = Stack.start_link(0)
    Stack.pop(pid, 1)
    assert :sys.get_state(pid) == -1
  end

  test "push/2 - add element to empty stack" do
    {:ok, pid} = Stack.start_link(0)
    Stack.push(pid, 1)
    assert :sys.get_state(pid) == 1
  end

  test "push/2 - add element to stack with multiple elements" do
    {:ok, pid} = Stack.start_link(10)
    Stack.push(pid, 5)
    Stack.push(pid, 5)
    Stack.push(pid, 5)
    assert :sys.get_state(pid) == 25
  end
end
