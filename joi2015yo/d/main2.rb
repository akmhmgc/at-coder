N, M = gets.chomp.split.map(&:to_i)
# D[i] 都市iと都市i-1の距離(i: 1 - N+1)
D = N.times.inject([0]) { |d| d << gets.to_i }

# C[i] i日目の天候の悪さ(i: 1 - M)
C = M.times.inject([0]) { |d| d << gets.to_i }

# i日目にj番目の都市にいる場合の最小の疲労度(i: 1 - M, j: 0 - N-1)
dp = Array.new(M + 1) { Array.new(N + 1, 10**20) }
dp[0][0] = 0

1.upto(M) do |i|
  0.upto(N) do |j|
    kouho = [dp[i - 1][j]]
    kouho << dp[i - 1][j - 1] + D[j] * C[i] if j >= 1
    dp[i][j] = kouho.min
  end
end

puts dp.last.last
