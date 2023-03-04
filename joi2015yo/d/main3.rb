N, M = gets.chomp.split.map(&:to_i)
D = Array.new(N) { gets.to_i }.unshift(0)
C = Array.new(M) { gets.to_i }.unshift(0)

INF = Float::INFINITY
dp = Array.new(M + 1) { Array.new(N + 1, INF) }
dp[0][0] = 0

1.upto(M) do |i|  # i日目
  0.upto(N) do |j| # 都市j
    dp[i][j] = [
      dp[i - 1][j],
      dp[i - 1][j - 1] + C[i] * D[j]
    ].min
  end
end

puts dp.last.last
