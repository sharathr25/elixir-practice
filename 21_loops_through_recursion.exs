# Due to immutability, 
# loops in Elixir (as in any functional programming language) are written differently from imperative languages

# example recursion program
defmodule Fibonacci do
    def fibonacci_for_N(0) do
        0
    end

    def fibonacci_for_N(1) do
        1
    end

    def fibonacci_for_N(n) do
        fibonacci_for_N(n-2) + fibonacci_for_N(n-1)
    end
end

defmodule MyList do
    # loop using recursion
    def print_elements([]) do
        
    end

    def print_elements([head|tail]) do
        IO.puts head
        print_elements(tail)
    end

    # reduce using recursion
    def sum_list([head | tail], acc) do
        sum_list(tail, acc + head)
    end

    def sum_list([], acc) do
        acc
    end

    # map using recursion
    def double_list([head | tail]) do
        [head * 2 | double_list(tail)]
    end

    def double_list([]) do
        []
    end
end

IO.puts Fibonacci.fibonacci_for_N(5)
MyList.print_elements([1,2,3])
IO.puts MyList.sum_list([1,2,3], 0)
IO.inspect MyList.double_list([1,2,3])