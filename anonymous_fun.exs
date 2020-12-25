add = fn a,b -> a + b end

IO.puts add.(1,2)

# NOTE : A dot (.) between the variable and parentheses is required to invoke an anonymous function. 
# The dot ensures there is no ambiguity between calling the anonymous function matched to a variable add and a named function add

# anonymous functions are also closures and as such they can access variables that are in scope when the function is defined
double = fn a -> add.(a, a) end

IO.puts double.(2) 
# in above example a is the scope of double function
# but, add function can access it