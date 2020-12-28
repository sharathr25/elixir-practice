# If a function with default values has multiple clauses, it is required to create a function head (without an actual body) for declaring defaults

defmodule Concat do
    # A function head declaring defaults
    # (This is required when we have multiple function with same name)
    def join(a, b \\ nil, sep \\ " ")

    def join(a, b, _sep) when is_nil(b) do
        a
    end

    def join(a, b, sep) do
        a <> sep <> b
    end
end

IO.puts Concat.join "Hello","world" # Hello world
IO.puts Concat.join "Hello","world","_" # Hello_world
IO.puts Concat.join "Hello" # Hello

# we are using _sep in 2nd join function to tell elixir we are not using it