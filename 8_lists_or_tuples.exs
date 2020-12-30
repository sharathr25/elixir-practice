# Lists are stored in memory as linked lists, 
# meaning that each element in a list holds its value and points to the following element until the end of the list is reached. 
# This means accessing the length of a list is a linear operation: we need to traverse the whole list in order to figure out its size.

# Similarly, the performance of list concatenation depends on the length of the left-hand list

# lists are dynamic size
# tupels are fixed size
 
list = [1, 2, 3]

# This is fast as we only need to traverse `[0]` to prepend to `list`
IO.inspect [0] ++ list

# This is slow as we need to traverse `list` to append 4
IO.inspect list ++ [ 4]

# Tuples, on the other hand, are stored contiguously in memory. 
# This means getting the tuple size or accessing an element by index is fast. 
# However, updating or adding elements to tuples is expensive because it requires creating a new tuple in memory:

tuple = {:a, :b, :c, :d}
IO.inspect put_elem(tuple, 2, :e)

# Note that this applies only to the tuple itself, not its contents. 
# For instance, when you update a tuple, all entries are shared between the old and the new tuple, except for the entry that has been replaced. 
# In other words, tuples and lists in Elixir are capable of sharing their contents. 
# This reduces the amount of memory allocation the language needs to perform and is only possible thanks to the immutable semantics of the language.