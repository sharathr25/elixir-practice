char_list = 'ABC'

IO.puts char_list # ABC

char_list_with_list_representation = [65,66,67]

IO.puts char_list_with_list_representation # ABC

# String interpolation is available in char lists
IO.puts '1 + 3 = #{1+3}'

# we have sigil as well
IO.puts ~c("Hello world")

# we can convert a string to char list
char_list_from_string = String.to_charlist "A string"
IO.puts char_list_from_string
