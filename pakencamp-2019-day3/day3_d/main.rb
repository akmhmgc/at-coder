N = gets.to_i

# dp[i][j]: i列目までを見た時に,i列目を色jにする時に塗り替える必要のある最小のマスの個数
dp = Array.new(N) { Array.new(3, Float::INFINITY) }

S = []

5.times do
  line = gets.chomp.split('').map do |v|
    next 0 if v == 'R'
    next 1 if v == 'B'
    next 2 if v == 'W'
    next 3 if v == '#'
  end
  S << line
end

S = S.transpose

dp[0][0] = 5 - S.first.count(0)
dp[0][1] = 5 - S.first.count(1)
dp[0][2] = 5 - S.first.count(2)

1.upto(N - 1) do |i|
  3.times do |j| # 何色に塗るか
    3.times do |k| # 前が何色か
      dp[i][j] = [
        dp[i][j],
        dp[i - 1][k] + (5 - S[i].count(j))
      ].min if j != k
    end
  end
end

puts dp.last.min
