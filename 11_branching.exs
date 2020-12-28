# case, cond, and if

# case - match value against pattern

# case value do
#   pattern_1 -> action_1
#   pattern_2 -> action_2
#           _ -> default_action
# end

case {1,2,3} do 
    {4 ,5, 6} -> IO.puts "will not match {1,2,3}"
    {1 ,2, 3} -> IO.puts "will match {1,2,3}"
end

# If you want to pattern match against an existing variable, you need to use the ^ operator
x = 1
case 2 do
    ^x -> IO.puts "will not match 1"
     _ -> IO.puts "will match (default)"
end

# Clauses also allow extra conditions to be specified via guards
case {1,2,3} do 
    {4 ,5, 6} -> IO.puts "will not match {1,2,3}"
    {1 ,x, 3} when x > 0 -> IO.puts "will match {1,2,3} since x is 2 which is greater than 1"
end

# cond - we want to check different conditions and find the first one that does not evaluate to nil or false. 
# In such cases, one may use cond

# cond do
#   condition_1 -> action_1
#   condition_2 -> action_2
#           true -> default_action
# end

cond do 
    1 + 2 === 5 -> IO.puts "This will not be true"
    1 + 2 === 3 -> IO.puts "This will be true"
end

#if and unless - useful when you need to check for only one condition
if true do 
    IO.puts "I will print if condition evaluates to true"
end

unless false do 
    IO.puts "I will print unless condition evaluates to false"
end

# if and unless shorthand
if true, do: IO.puts "true"
unless false, do: IO.puts "false"
if false, do: IO.puts "true", else: IO.puts "false"