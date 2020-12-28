# Whenever you need a key-value store, maps are the “go to” data structure in Elixir. 
# A map is created using the %{} syntax

# Compared to keyword lists, we can already see two differences:
    # Maps allow any value as a key.
    # Maps’ keys do not follow any ordering.

map = %{:a => 1, 2 => :b}
IO.puts map[:a] # 1
IO.puts map[2] # b
# alternate way to get value
IO.puts Map.get map,:a

# we can match a subset of map
%{:a => var_a} = map
IO.puts var_a # 1

# if subset doesn't have any match, then we will get error
# %{:c => var_c} = map # will throw error

# we can add values to map
IO.inspect Map.put map, :c, 3

# maps have the following syntax to update values
IO.inspect %{map | 2 => "two"}

# If we try to update a key which is not there in the map, we will get an error
# %{map | :d => "two"} # will throw error

# when all the keys are atoms, we use shorthand
map2 = %{a: 1, b: 2}
IO.puts map2[:b]