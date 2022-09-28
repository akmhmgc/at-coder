N = gets.to_i
C = N.times.reduce([]) { |c| c << gets.to_i }

INF = 10**20
dp = Array.new(N, INF)

count = 0
C.each do |ci|
  idx = dp.bsearch_index { |v| v >= ci }
  count += 1 if dp[idx] != INF
  dp[idx] = ci
end

puts count
