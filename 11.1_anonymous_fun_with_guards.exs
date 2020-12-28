fun = fn 
    a,b when a > 0 -> a + b
    a,b when a < 0 -> a * b
end

IO.puts fun.(1,2) # 3
IO.puts fun.(-1,2) # -2

# NOTE: The number of arguments in each anonymous function clause needs to be the same, otherwise an error is raised.