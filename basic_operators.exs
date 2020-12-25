# and, or and not are strict so they can only accept boolean or something that evaluates to boolean as their first argument
IO.puts "and, or and not"
IO.puts true and true
IO.puts true or false
IO.puts true and is_atom(:apple)
IO.puts not true

# providing non boolean as 1st arg will raise an exception
# IO.puts 1 and true

# but the below will give 1, because only 1st arg should be boolean
IO.puts true and 1

IO.puts "***********************"
# ------------------------------------------------------------------------------------------

# ||, &&, ! can any accept any type of data
IO.puts "&&, || and !"
IO.puts 1 || 0
IO.puts nil && 1 # all values except false and nil will evaluate to true
IO.puts !0

IO.puts "***********************"
# ------------------------------------------------------------------------------------------

# ==, !=, ===, !==, <=, >=, < and > comparison operators
IO.puts "==, !=, ===, !==, <=, >=, < and >"
# similar to js