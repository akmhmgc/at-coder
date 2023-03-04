# dp[i][j]: i日目に服jを選んだ時絶対値の合計

D, N = gets.chomp.split.map(&:to_i)
T = Array.new(D) { gets.to_i }
A = []
B = []
C = []
N.times do
  a, b, c = gets.chomp.split.map(&:to_i)
  A << a
  B << b
  C << c
end

dp = Array.new(D) { Array.new(N, (-1) * 10 ** 20) }
N.times do |i|
  dp[0][i] = 0 if A[i] <= T[0] && T[0] <= B[i]
end

1.upto(D - 1) do |i|
  N.times do |j|
    N.times do |k|
      dp[i][j] = [dp[i][j], dp[i - 1][k] + (C[k] - C[j]).abs].max if A[j] <= T[i] && T[i] <= B[j]
    end
  end
end

puts dp.last.max
