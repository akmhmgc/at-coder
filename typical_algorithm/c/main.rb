N = gets.to_i
A = Array.new(N) { gets.chomp.split.map(&:to_i) }

INF = 10**20
dp = Array.new(1 << N) { Array.new(N, INF) }
dp[0][0] = 0

1.upto((1 << N) - 1) do |s|
  N.times do |i|
    arr = []
    N.times do |j|
      next unless (s >> i) & 1 == 1

      arr << dp[s & ~(1 << i)][j] + A[j][i]
    end
    dp[s][i] = arr.min if arr.any?
  end
end

puts dp[(1 << N) - 1][0]

p dp[0]
p dp[1]
p dp[2]
