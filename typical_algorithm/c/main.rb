N = gets.to_i
A = Array.new(N) { gets.chomp.split.map(&:to_i) }

INF = 10**20
dp = Array.new(1 << N) { Array.new(N, INF) }
dp[0][0] = 0

1.upto((1 << N) - 1) do |s|
  N.times do |i|
    N.times do |j|
      next unless (s >> i) & 1 == 1

      dp[s][i] = [dp[s][i], dp[s & ~(1 << i)][j] + A[j][i]].min
    end
  end
end

puts dp[(1 << N) - 1][0]
