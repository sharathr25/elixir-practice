str1 = "Hello"
str2 = "world"
str_with_2_bytes_char = "hellö"

IO.puts String.length(str_with_2_bytes_char); #5
IO.puts byte_size(str_with_2_bytes_char) #6, because 'ö' takes 2 bytes

IO.puts "#{str1} #{str2}" # interpolation

IO.puts str1 <> " " <> str2 # concatenatioon

IO.puts is_binary str1 #true, because Strings in Elixir are represented internally by contiguous sequences of bytes known as binaries

IO.puts String.upcase str1
IO.puts String.downcase str1

