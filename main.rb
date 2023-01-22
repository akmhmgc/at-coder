N = gets.to_i

dp = [1, 1]

2.upto(45) do
  dp << dp[-1] + dp[-2]
end

puts dp[N]
