N, K, D = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)
A.unshift(0)

# dp[i][j][k]: i番目まで見た時にj個選んだ時の余りがkの最大値

dp = Array.new(N + 1) { Array.new(K + 1) { Array.new(D, -10**20) } }

# 初期値
0.upto(N) { |i| dp[i][0][0] = 0 }

# i番目まで見たとき
1.upto(N) do |i|
  ai = A[i]
  mi = A[i] % D
  # j個選んだ時
  1.upto(K) do |j|
    0.upto(D-1) do |k|
      dp[i][j][k] = [dp[i][j][k], dp[i - 1][j][k]].max
      dp[i][j][k] = [dp[i][j][k], dp[i - 1][j - 1][(k - mi)%D] + ai].max
    end
  end
end

puts dp.last.last.first < 0 ? -1 : dp.last.last.first
