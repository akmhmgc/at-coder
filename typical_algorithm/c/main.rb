N = gets.to_i
A = Array.new(N) { gets.chomp.split.map(&:to_i) }

INF = 10**20
dp = Array.new(1 << N) { Array.new(N,INF) }
dp[0][0] = 0

1.upto((1 << N) - 1) do |s|
  N.times do |i|
    arr = []
    N.times do |j|
      next if s == s & ~(1 << i)
  
      arr << dp[s & ~(1 << i)][j] + A[j][i]
      # p dp[s & ~(1 << i)][j] + A[j][i]
      # dp[s][i] = [
      #   dp[s][i],
      #   dp[s & ~(1 << i)][j] + A[j][i]
      # ].min
    end
    dp[s][i] = arr.min if arr.any?
  end
end

# p dp[1 << 0] #=> 0番目の街にしか到達していないので[0, INF, INF, INF]であるべき

puts dp[(1 << N) -1][0]

# p dp[1 << 1]  

# dp.each_with_index do |v, idx|
#   p format('%.4d', idx.to_s(2))
#   p v.reverse
# end
