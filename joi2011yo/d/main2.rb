N = gets.to_i
Q = gets.chomp.split.map(&:to_i)
F = Q[0...-1]
A = Q[-1]

# dp[i][j]: 前からi番目まで見た時にjとなる計算式の数
dp = Array.new(N - 1) { Array.new(21, 0) }
dp[0][F[0]] = 1

1.upto(N - 2) do |i|
  0.upto(20) do |j|
    dp[i][j] += dp[i - 1][j - F[i]] if j - F[i] >= 0
    dp[i][j] += dp[i - 1][j + F[i]] if j + F[i] <= 20
  end
end

puts dp.last[A]
