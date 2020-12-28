defmodule Math do
    def sum(a,b) do
        a + b
    end
end

fun = &Math.sum/2

IO.puts fun.(1,2) # 3

# function capturing can be used as a shorthand to create anonymous function
sum = &(&1 + &2)

# &1 represents 1st arg and &2 represents 2nd arg

IO.puts sum.(1,2) # 3