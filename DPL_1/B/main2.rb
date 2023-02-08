N, M = gets.chomp.split.map(&:to_i)
V = [0]
W = [0]

N.times do
  v, w = gets.chomp.split.map(&:to_i)
  V << v
  W << w
end

# dp[i]: 重さiの時の最大の価値
dp = Array.new(M + 1, 0)

1.upto(N) do |i|
  M.downto(0) do |j|
    wi = W[i]
    vi = V[i]
    dp[j] = [dp[j], dp[j - wi] + vi].max if j - wi >= 0
  end
end

puts dp.max
