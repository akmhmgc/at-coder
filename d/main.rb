N = gets.to_i
A = N.times.reduce([]) { |a| a << gets.to_i }

INF = 10**20

# dp[i]: 長さiのLISの最後の値の最小値
dp = Array.new(N, INF)

len = 0
A.each do |val|
  idx = dp.bsearch_index { |x| x >= val }
  dp[idx] = val
  len = [len, idx].max
end

puts len + 1
