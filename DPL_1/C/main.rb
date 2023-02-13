N, W = gets.chomp.split.map(&:to_i)

# dp[i]: 合計で重さi以下の時の最大の価値
dp = Array.new(W + 1, 0)

N.times do |i|
  v, w = gets.chomp.split.map(&:to_i)
  w.upto(W) do |j| # これにより必ずj - w >= 0 となる
    dp[j] = [dp[j], dp[j - w] + v].max
  end
end

puts dp.last
