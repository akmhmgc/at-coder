N, M, K = gets.chomp.split.map(&:to_i)

waru = 998_244_353
dp = Array.new(M + 1) { Array.new(K + 1, 0) }
dp[0][0] = 1

1.upto(M) do |i|
  (K + 1).times do |j|
    dp[i][j] += dp[i - 1][j]
    dp[i][j] += dp[i - 1][j - i] if j - i >= 0
  end
end

p dp 
