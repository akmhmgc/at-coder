N, M, K = gets.chomp.split.map(&:to_i)
MOD = 998244353

# dp[i][j]: i回目にjにいる確率
dp = Array.new(K + 1) { Array.new(N + 1, 0) }

dp[0][0] = 1

1.upto(K) do |i|
  0.upto(N) do |j|
    1.upto(M) do |k|
      dp[i][j] += dp[i - 1][j - k] * M * MOD if j - k >= 0 

      dp[i][j] += dp[i - 1][2*M - (j + k)] * M * MOD if 2*M - (j + k) <= N && 2*M - (j + k) >= 0
    end
  end
end

p dp
