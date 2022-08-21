n = gets.to_i

arr = gets.chomp.split.map(&:to_i)

dp = [10**9] * n
dp[0] = 0
dp[1] = (arr[1] - arr[0]).abs

for i in 2..(n - 1) do
  dp[i] = [(arr[i] - arr[i - 1]).abs + dp[i - 1], dp[i]].min
  dp[i] = [(arr[i] - arr[i - 2]).abs + dp[i - 2], dp[i]].min
end

puts dp.last
