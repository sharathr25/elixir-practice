x = 1
IO.puts 1 = x
# IO.puts 2 = x # (MatchError) if left side is not matching with right side

# pattern matching in data structures
{a, b, c} = {"Hello", :world, "!"}
IO.puts a
IO.puts b
IO.puts c

# {a, b, c} = {:hello, "world"} # (MatchError) tuples have different sizes
# {a, b, c} = ["Hello", :world, "!"] # (MatchError) diffrent types

{:ok, d} = {:ok, "will match"}
IO.puts d

# {:ok, e} = {:error, "this will not match"} # specific value not matching i.e :ok is not matching 

[f, g, h] = ["list", "matching", "!"]
IO.puts f
IO.puts g
IO.puts h

# matching head and tail
[head | tail] = [1, 2, 3]
IO.puts head
IO.inspect tail

# pin operator
# Variables in Elixir can be rebound
x = 1
x = 2
IO.puts x # 2

# Use the pin operator ^ when you want to pattern match against a variable’s existing value rather than rebinding the variable
# ^x = 3 # match error no match of right hand side value: 3

# when we dont want a value in pattern
[h | _] = [4, 5, 6]
IO.puts h # 4