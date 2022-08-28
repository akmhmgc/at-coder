N = gets.to_i
A = gets.chomp.split.map(&:to_i)

dp = Array.new(N - 1) { Array.new(21, 0) }
dp[0][A[0]] = 1

1.upto(N - 2) do |i|
  0.upto(20) do |j|
    dp[i][j] += dp[i - 1][j - A[i]] if j - A[i] >= 0
    dp[i][j] += dp[i - 1][j + A[i]] if j + A[i] <= 20
  end
end

puts dp.last[A.last]
