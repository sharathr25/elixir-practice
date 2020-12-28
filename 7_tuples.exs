# Tuples store elements contiguously in memory.
# This means accessing a tuple element by index or getting the tuple size is a fast operation

tuple = {:ok, "hello"}

IO.puts tuple_size tuple

IO.puts elem tuple,1 # hello, Indexes start from zero

IO.inspect put_elem tuple, 1, "world" # when modify a tuple we will always get new tuple, Since in elixir everything is immutable

# common usecase
File.read("./hello.txt") # {:ok, "world"}