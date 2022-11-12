N, M, K = gets.chomp.split.map(&:to_i)
MOD = 998_244_353

# dp[i][j]: i回目にjにいる確率
dp = Array.new(K + 1) { Array.new(N + 1, 0) }

dp[0][0] = 1

m_intv = M.pow(MOD - 2, MOD)

0.upto(K - 1) do |i|
  0.upto(N) do |j|
    dp[i + 1][j] += dp[i][j] if j == N

    1.upto(M) do |k|
      nx = j + k
      nx = 2 * N - nx if nx > N
      dp[i + 1][nx] += dp[i][j] * m_intv % MOD
    end
  end
end


ans = 0

1.upto(K) do |i|
  ans += dp[i][K] % MOD
end

puts ans % MOD


# 確率DPをやりなおう
