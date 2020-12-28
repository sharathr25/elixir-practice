#  when we have a list of tuples and the first item of the tuple (i.e. the key) is an atom, we call it a keyword list
list = [{:a, 1}, {:b, 2}]
IO.inspect list # [a: 1, b: 2]
# we can also represent the above as [a: 1, b: 2], Which can be verified with below statement
IO.puts list === [a: 1, b: 2] # true

# since keyword lists are lists we can use all oprations available in lists
list2 = list ++ [c: 3]
IO.inspect list2 # [a: 1, b: 2, c: 3]

list3 = [z: 0] ++ list
IO.inspect list3 # [z: 0, a: 1, b: 2]

IO.puts list[:a] # 1