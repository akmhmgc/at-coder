N, M = gets.chomp.split.map(&:to_i)
W = gets.chomp.split.map(&:to_i)
W.unshift(0)

# dp[i][j]
# 前からi個まで見て重さjを表現するのに必要な最も少ない重りの数
dp = Array.new(N + 1) { Array.new(M + 1, 0) }

# 番兵は最後に入れるのがミスらないコツ
dp[0] = Array.new(M + 1, N + 1)
dp[0][0] = 0

1.upto(N) do |i|
  0.upto(M).each do |j|
    dp[i][j] = j - W[i] < 0 ? dp[i - 1][j] : [dp[i - 1][j], dp[i - 1][j - W[i]] + 1].min
  end
end
