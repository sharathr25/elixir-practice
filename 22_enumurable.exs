# Enum map syntax
# Enum.map(list_which_we_need_to_modify, function_which_modifies_list)
double_list = Enum.map([1,2,3], fn n -> n*2 end)
double_list_shorthand = Enum.map([1,2,3], &(&1*2))
IO.inspect double_list
IO.inspect double_list_shorthand

# Enum reduce syntax
# Enum.map(list, initial_accumulator_value, function_to_reduce_list)
sum_list = Enum.reduce([1,2,3], 0, fn acc, cur -> acc + cur end)
sum_list_shorthand_1 = Enum.reduce([1,2,3], 0, &(&1+&2))
sum_list_shorthand_2 = Enum.reduce([1,2,3], 0, &+/2)
IO.puts sum_list
IO.puts sum_list_shorthand_1
IO.puts sum_list_shorthand_2

# Enum reduce syntax
# Enum.map(list, function_to_filter_list)
odd_nos = Enum.filter([1,2,3], fn n -> rem(n,2) != 0 end)
odd_nos_shorthand  = Enum.filter([1,2,3], &(rem(&1,2) != 0))
IO.inspect odd_nos
IO.inspect odd_nos_shorthand

# The |> symbol used in the snippet above is the pipe operator: 
# it takes the output from the expression on its left side and passes it as the first argument to the function call on its right side
sum_of_odd_multiples_of_3_less_than_100000 = 1..100_000 
    |> Enum.filter(&(rem(&1,2) !==0 )) 
    |> Enum.map(&(&1*3))
    |> Enum.reduce(0, &+/2)
IO.puts sum_of_odd_multiples_of_3_less_than_100000

# Instead of generating intermediate lists, 
# streams build a series of computations that are invoked only when we pass the underlying stream to the Enum module. 
# Streams are useful when working with large, possibly infinite, collections.
# use Stream for the particular scenarios where laziness is required, 
# to either deal with slow resources or large, possibly infinite, collections.
odd_multiples_of_3 = 1..100_000 
    |> Stream.filter(&(rem(&1,2) !==0 )) 
    |> Stream.map(&(&1*3))
    |> Enum.to_list # after performing stream operation we get stream,So we need to convert it to list
IO.inspect odd_multiples_of_3