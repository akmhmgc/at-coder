N, M = gets.chomp.split.map(&:to_i)
V = [0]
W = [0]

N.times do
  v, w = gets.chomp.split.map(&:to_i)
  V << v
  W << w
end

# dp[i][j]: i番目の品物まで見て重さjの時の最大の価値
dp = Array.new(N + 1) { Array.new(M + 1, 0) }

1.upto(N) do |i|
  (M + 1).times do |j|
    wi = W[i]
    vi = V[i]
    dp[i][j] = dp[i - 1][j]
    dp[i][j] = [dp[i][j], dp[i - 1][j - wi] + vi].max if j - wi >= 0
  end
end

puts dp.last.max
