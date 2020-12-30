# Lists are stored in memory as linked lists, 
# meaning that each element in a list holds its value and points to the following element until the end of the list is reached. 
# This means accessing the length of a list is a linear operation

list = [1, 1.0, true, "hello"]
IO.inspect list

IO.puts length list

IO.inspect list ++ [4,5,6]

IO.inspect list -- [1]

# to get an element from a list
IO.puts Enum.at list,0

#if we access an element with an index which is not there, then we will get nil
IO.puts Enum.at list,5

head = hd list # hd [] i.e when we try to read head of empty list error will be thrown
tail = tl list

IO.puts head
IO.inspect tail

printable_ASCII_nums = [104, 101, 108, 108, 111]

IO.puts printable_ASCII_nums # hello, Because When Elixir sees a list of printable ASCII numbers, Elixir will print that as a charlist

IO.puts 'hello' == "hello" # false, charlists != strings

# to check a element exists in list we can use 'in'
IO.puts 1 in list

# We can replace an item in list
new_list = List.replace_at list,0,2
IO.inspect new_list

# we can insert an item in list
new_list1 = List.insert_at list,1,3
IO.inspect new_list1

# we can insert an item from end of a list, we have to use negative index
new_list2 = List.insert_at list, -1, 5
IO.inspect new_list2

# to insert to the beginning we can use pipe '|' operator
new_list3 = [10 | new_list2]
IO.inspect new_list3