A, B = gets.chomp.split.map(&:to_i)

def solve(x)
  return A if x == A

  solve(x - 1) + x
end

puts solve(B)
