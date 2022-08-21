N, L = gets.chomp.split.map(&:to_i)

dp = Array.new(N + 1 + L, 0)

dp[0] = 1

(N + 1).times do |i|
  next if i.zero?

  dp[i] = dp[i - 1] + dp[i - L]
end

puts dp[-L - 1] % (10**9 + 7)


