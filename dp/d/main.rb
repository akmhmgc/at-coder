N, W = gets.chomp.split.map(&:to_i)
WV = Array.new(N) { gets.chomp.split.map(&:to_i) }
WV.unshift([])

INF = -10**20

# dp[i][j]: i番目までを考えた時の重さの合計がj以下である時の最大の価値
dp = Array.new(N) { Array.new(W + 1, INF) }

# 0番目は全て価値が0
dp.unshift(Array.new(W + 1, 0))

1.upto(N) do |i|
  0.upto(W) do |j|
    w, v = WV[i]
    arr = [dp[i - 1][j]]
    arr << dp[i - 1][j - w] + v if j - w >= 0

    dp[i][j] = arr.max
  end
end

puts dp.last.last
