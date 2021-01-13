defmodule TaskList do
    defstruct id: 0, entries: %{}

    def new(entries \\ []) do
        Enum.reduce(
            entries,
            %TaskList{},
            fn entry, acc -> add_task(acc, entry) end
        )
    end 

    def add_task(task_list, entry) do
        entry = Map.put(entry, :id, task_list.id)

        new_entries = Map.put(
            task_list.entries,
            task_list.id,
            entry
        )

        %TaskList{
            task_list
            | entries: new_entries, 
              id: task_list.id + 1
        }
    end

    def get_all(task_list) do
        task_list.entries
    end

    def get_tasks(task_list, date) do
        task_list.entries
        |> Stream.filter(fn {_, entry} -> entry.date === date end)
        |> Enum.map(fn {_, entry} -> entry end)
    end

    def update_task(task_list, %{} = new_entry) do
        IO.puts new_entry.id
        update_task(task_list, new_entry.id, fn _ -> new_entry end)
    end

    def update_task(task_list, entry_id, update_fn) do
        case Map.fetch(task_list.entries, entry_id) do
            {:error} -> task_list

            {:ok, old_entry} -> 
                new_entry = update_fn.(old_entry)

                new_entries = Map.put(
                    task_list.entries,
                    new_entry.id,
                    new_entry
                )    

                %TaskList{task_list | entries: new_entries}
        end
    end
end

defmodule TaskServer do
    # def start do
    #     GenericServer.start(TaskServer)    
    # end
    
    # def init do
    #     TaskList.new()
    # end

    # def add_task(server_pid, new_entry) do
    #     GenericServer.cast(server_pid, {:add_task, new_entry})
    # end

    # def get_tasks(server_pid, date) do
    #     GenericServer.call(server_pid, {:get_tasks, date})
    # end

    # def handle_cast({:add_task, new_entry}, task_list) do
    #     TaskList.add_task(task_list, new_entry)
    # end

    # def handle_call({:get_tasks, date}, task_list) do
    #     {TaskList.get_tasks(task_list, date), task_list}
    # end

    use GenServer

    def start_link do
        GenServer.start_link(__MODULE__, []) # __MODULE__ is current module name i.e TaskServer
    end

    def init(_) do
        send(self(), :process_init)
        {:ok, TaskList.new()}
    end

    def add_task(server_pid, new_entry) do
        GenServer.cast(server_pid, {:add_task, new_entry})
    end

    def get_tasks(server_pid, date) do
        GenServer.call(server_pid, {:get_tasks, date})
    end

    def update_task(server_pid, entry) do
        GenServer.cast(server_pid, {:update_task, entry})
    end

    def get_all(serer_pid) do
        GenServer.call(serer_pid, :get_all)
    end

    def handle_cast({:add_task, new_entry}, task_list) do
        {:noreply, TaskList.add_task(task_list, new_entry)}
    end

    def handle_cast({:update_task, entry}, task_list) do
        {:noreply, TaskList.update_task(task_list, entry)}
    end

    def handle_call({:get_tasks, date}, _from, task_list) do
        {:reply, TaskList.get_tasks(task_list, date), task_list}
    end 

    def handle_call(:get_all, _from, task_list) do
        {:reply, TaskList.get_all(task_list), task_list}
    end 

    def handle_info(:process_init, state) do
        IO.inspect("Tasklist is ready")
        {:noreply, state}
    end

    def handle_info(:shut_down, state) do
        Process.exit(self(), :kill)
        {:noreply, state}
    end

    def handle_info(msg, state) do
        IO.inspect("Invelid Message: #{msg}")
        {:noreply, state}
    end

end