IO.puts ?a # ? is used to get code point of a character
IO.puts "\u0061" === "a" # 97 in hex 0061
IO.inspect "hello" <> <<0>> # to see the inner binary representation of a string is to concatenate the null byte <<0>> to it

# by default 8 bits is used to store data in elixir, but we can manually specify this number
# ex 3 -> 0011
IO.puts <<0::1, 0::1, 1::1, 1::1>> === <<3::4>>