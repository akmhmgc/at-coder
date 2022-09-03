N = gets.to_i
A, B = gets.chomp.split.map(&:to_i)

if [A,B].min > N
  puts N - 1
  exit
end

# 最大でジャンプする数
M = N / [A, B].min + 1

dp = Array.new(M) { Array.new(N + 1, false) }
dp[0][0] = true

1.upto(M - 1) do |i|
  (N + 1).times do |j|
    dp[i][j] ||= dp[i - 1][j]
    dp[i][j] ||= dp[i - 1][j - A] if j - A >= 0
    dp[i][j] ||= dp[i - 1][j - B] if j - B >= 0
  end
end

# 頂上の対応
[A, B].min.times do |k|
  dp[-1][N] ||= dp[-2][N - k]
end

puts dp.last.count(false)
