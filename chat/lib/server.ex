defmodule Chat.Server do
    use GenServer

    #client side
    def start_link([]) do
        GenServer.start_link(__MODULE__, [], name: :chat_room)
    end

    def get_msgs do
        GenServer.call(:chat_room, :get_msgs)
    end

    def add_msg(msg) do
        GenServer.cast(:chat_room, {:add_msg, msg })
    end

    #server side / callback function
    @impl true
    def init(msgs) do
        {:ok, msgs}
    end

    @impl true
    def handle_call(:get_msgs, _from, msgs) do
        {:reply, msgs, msgs}
    end

    @impl true
    def handle_cast({:add_msg, msg}, msgs) do
        {:noreply, [msg | msgs]}
    end
end

# we can kill the process
# Process.whereis(:chat_room) |> Process.exit(:kill)
# when we kill the process the Chat.Supervisor will start Chat.Server process again
