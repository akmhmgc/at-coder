N = gets.to_i
A = gets.chomp.split.map(&:to_i)
B = gets.chomp.split.map(&:to_i)

# dp[i]: 0からiまでに到達する最短距離
dp = Array.new(N, 0)
dp[-1] = 1000

1.upto(N - 1) do |i|
  dp[i] = [dp[i - 1] + A[i - 1],
           dp[i - 2] + B[i - 2]].min
end

puts dp[-1]
