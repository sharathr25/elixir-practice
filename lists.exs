# Lists are stored in memory as linked lists, 
# meaning that each element in a list holds its value and points to the following element until the end of the list is reached. 
# This means accessing the length of a list is a linear operation

list = [1, 1.0, true, "hello"]
IO.inspect list

IO.puts length list

IO.inspect list ++ [4,5,6]

IO.inspect list -- [1]

head = hd list # hd [] i.e when we try to head of empty list error will be thrown
tail = tl list

IO.puts head
IO.inspect tail

printable_ASCII_nums = [104, 101, 108, 108, 111]

IO.puts printable_ASCII_nums # hello, Because When Elixir sees a list of printable ASCII numbers, Elixir will print that as a charlist

IO.puts 'hello' == "hello" # false, charlists != strings