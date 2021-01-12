defmodule Fraction do
    defstruct x: nil, y: nil   

    def new(x, y) do
        %Fraction{x: x, y: y}
    end

    def value(%Fraction{x: x, y: y}) do
        x / y
    end
end