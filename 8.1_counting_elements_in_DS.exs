# When counting the elements in a data structure, 
# Elixir also abides by a simple rule: the function is named size if the operation is in constant time (i.e. the value is pre-calculated) 
# or length if the operation is linear (i.e. calculating the length gets slower as the input grows).
# As a mnemonic, both “length” and “linear” start with “l”.

str = "hello"
list = [1,2,3]
tuple = {"a", "b", "c"}

IO.puts byte_size str # 5
IO.puts String.length str # 5

IO.puts length list # 3

IO.puts tuple_size tuple # 3