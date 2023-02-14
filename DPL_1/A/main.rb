N, M = gets.chomp.split.map(&:to_i)
C = gets.chomp.split.map(&:to_i)

# dp[i]: i円を実現できる最小の枚数
INF = 10**20
dp = Array.new(N + 1, INF)
dp[0] = 0

C.each do |ci|
  ci.upto(N) do |i|
    dp[i] = [dp[i - ci] + 1, dp[i]].min
  end
end

puts dp.last
