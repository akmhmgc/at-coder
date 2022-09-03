N = gets.to_i
A, B = gets.chomp.split.map(&:to_i)

if [A, B].min > N
  puts N - 1
  exit
end

dp = Array.new(N + 1, false)
dp[0] = true

1.upto(N) do |i|
  dp[i] ||= dp[i - A] if i - A >= 0
  dp[i] ||= dp[i - B] if i - B >= 0
end

# 最後
start = [N - [A, B].min, 0].max
start.upto(N - 1) do |i|
  dp[N] ||= dp[i]
end

puts dp.count(false)
