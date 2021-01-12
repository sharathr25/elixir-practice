defmodule Playground do
    def start do
        spawn(fn -> loop(0) end)
    end

    def view(server_id) do
        send(server_id, {:view, self()})
        receive do
            {:response, value} -> 
                value
        end
    end

    def add(server_id, value) do
        send(server_id, {:add, value})
    end

    def sub(server_id, value) do
        send(server_id, {:add, value})
    end

    def mul(server_id, value) do
        send(server_id, {:add, value})
    end

    def div(server_id, value) do
        send(server_id, {:add, value})
    end

    defp loop(current_value) do
        new_value = receive do
            {:view, caller_id} ->
                send(caller_id, {:response, current_value})
                current_value
            {:add, value} ->
                current_value + value
            {:sub, value} ->
                current_value - value
            {:mul, value} ->
                current_value * value
            {:div, value} ->
                current_value / value
            _ -> IO.puts("invalid msg")    
        end

        loop(new_value)
    end
end