N, X = gets.chomp.split.map(&:to_i)
A = [0]
B = [0]
N.times do
  a, b = gets.chomp.split.map(&:to_i)
  A << a
  B << b
end

# dp[i][j]: AiをBi枚数用いてj円を払えるかどうか
dp = Array.new(N + 1) { Array.new(X + 1, false) }
dp[0][0] = true

1.upto(N) do |i|
  (X + 1).times do |j|
    0.upto(B[i]) do |bi|
      ai = A[i]
      dp[i][j] ||= dp[i - 1][j - ai * bi] if j - ai * bi >= 0
    end
  end
end

puts dp.last.last ? 'Yes' : 'No'
