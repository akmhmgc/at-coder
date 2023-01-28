N, X = gets.chomp.split.map(&:to_i)
A = [0]
B = [0]
N.times do
  a, b = gets.chomp.split.map(&:to_i)
  A << a
  B << b
end

# dp[i]: i円を払えるかどうか
dp = Array.new(X + 1, false)
dp[0] = true

(N + 1).times do |i|
  B[i].times do
    X.downto(0) do |j|
      ai = A[i]
      dp[j] ||= dp[j - ai] if j - ai >= 0
    end
  end
end

puts dp.last ? 'Yes' : 'No'
