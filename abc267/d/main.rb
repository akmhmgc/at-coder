N, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i).unshift(0)

# 前からi個見てj個選んだ時の最大値
dp = Array.new(N + 1) { Array.new(M, -10**15).unshift(0) }

1.upto(N) do |i|
  1.upto(M) do |j|
    dp[i][j] = i < j ? -10**15 : [dp[i - 1][j], dp[i - 1][j - 1] + j * A[i]].max
  end
end

puts dp.last.last
