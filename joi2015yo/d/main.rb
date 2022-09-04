N, M = gets.chomp.split.map(&:to_i)
D = N.times.inject([]) { |d| d  << gets.to_i }
C = M.times.inject([]) { |d| d  << gets.to_i }.unshift(0)

# i日目にj番目の都市にいる場合の最小の疲労度
dp = Array.new(M + 1) { Array.new(N + 1, 10**20) }
dp[0][0] = 0

1.upto(M) do |i|
  (N + 1).times do |j|
    kouho = [dp[i - 1][j]]
    kouho << dp[i - 1][j - 1] + D[j - 1] * C[i] if j - 1 >= 0
    dp[i][j] = kouho.min
  end
end

puts dp.last.last
