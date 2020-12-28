defmodule Math do
    def sum(a,b) do
        do_sum(a,b)
    end

    defp do_sum(a,b) do
        a + b
    end

    # function declaration also supports guard and multiple classes
    def zero?(0) do
        true
    end

    def zero?(x) when is_integer(x) do
        false        
    end

    # The trailing question mark in zero? means that this function returns a boolean
    # naming convention
end

IO.puts Math.sum 1,2 # 3
IO.puts Math.zero? 0 # true
IO.puts Math.zero? 1 # false
# IO.puts Math.do_sum 1,2 # will get undefined error