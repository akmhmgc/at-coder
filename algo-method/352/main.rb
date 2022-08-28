N, A, B = gets.chomp.split.map(&:to_i)
X = gets.chomp.split.map(&:to_i)
X.unshift(0)
X.map!{|x| x % A}

dp = Array.new(N + 1) { Array.new(A, false) }
dp[0][0] = true

1.upto(N) do |i|
  A.times do |j|
    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - X[i]]
  end
end

puts dp.transpose[B].include?(true) ? 'Yes' : 'No'
