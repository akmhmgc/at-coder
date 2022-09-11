N = gets.to_i

def solve(x)
  return 1 if x == 1

  x + solve(x - 1)
end

puts solve(N)
