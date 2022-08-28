N = gets.to_i
W = gets.chomp.split.map(&:to_i)
W.unshift(0)

Sum = W.sum

dp = Array.new(N + 1) { Array.new(Sum + 1, false) }
dp[0][0] = true

1.upto(N) do |i|
  0.upto(Sum).each do |j|
    dp[i][j] = dp[i - 1][(j + W[i]) % Sum] || dp[i - 1][j - W[i]]
  end
end

p dp

