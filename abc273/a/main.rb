N = gets.to_i

def rec(v)
  return 1 if v == 0

  v * rec(v - 1)
end


puts rec(N)
