N = gets.to_i
A = N.times.reduce([]) { |arr| arr << gets.to_i }

INF = 10**10
dp = Array.new(N, INF)

(N - 1).downto(0) do |i|
  ai = A[i]
  idx = dp.bsearch_index { |v| v > ai }
  dp[idx] = ai
end

puts(dp.count { |v| v != INF })
