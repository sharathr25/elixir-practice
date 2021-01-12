defmodule TaskList do
    def new do
        MultiStorage.new()
    end

    def add_task(task_list, date, value) do
        MultiStorage.add(task_list, date, value)
    end

    def get_tasks(task_list, date) do
        MultiStorage.get(task_list, date)
    end
end

defmodule MultiStorage do
    def new do
        %{}
    end

    def add(storage, date, value) do
        Map.update(
            storage, 
            date, 
            [value], 
            fn tasks -> [value | tasks] end
        )
    end

    def get(storage, date) do
        Map.get(storage, date, [])
    end
end
