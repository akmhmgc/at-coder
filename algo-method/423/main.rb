N = gets.to_i

@memo = Array.new(N + 1, -1)
@memo[0] = 0
@memo[1] = 1

def solve(x)
  return @memo[x] if @memo[x] != -1

  # 代入した値が帰り値となる
  @memo[x] = solve(x - 1) + solve(x - 2)
end

puts solve(N)
