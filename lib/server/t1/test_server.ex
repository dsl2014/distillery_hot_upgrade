defmodule TestServer do
  use GenServer
  import Registry.Test


  def start_link() do
    IO.puts "hot server-----------------------------"
    GenServer.start_link(__MODULE__, [], name: rg("server"))
  end

  ## CALLBACK
  def init([]) do
    {:ok, []}
  end

  def handle_call({:get_id, name}, _from, state) do
    IO.puts "hot upgrade-------------------------------------------"
    IO.inspect name, label: "name---------------------------------:"
    {:reply, 0, state}
  end

  def handle_call(args, _from, state) do
    IO.inspect args, label: "receive a unknown call msg"
    {:reply, :ok, state}
  end

  def handle_cast(args, state) do
    IO.inspect args, label: "receive a unknown cast msg"
    {:noreply, state}
  end


  def handle_info(msg, state) do
    IO.inspect msg, label: "receive a unknown info msg"
    {:noreply, state}
  end

  def test() do
    GenServer.call(rg("server"), {:get_id, 1})
  end

end
