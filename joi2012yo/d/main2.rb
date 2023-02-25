N, K = gets.chomp.split.map(&:to_i)
A = Array.new(N + 1, 0)
K.times do
  d, k = gets.chomp.split.map(&:to_i)
  A[d] = k
end

# dp[i][j]: i日目に種類jのパスタをk回連続で作る組み合わせの数
dp = Array.new(N + 1) { Array.new(4) { Array.new(3, 0) } }

if A[1] == 0
  1.upto(3) { |i| dp[1][i][1] = 1 }
else
  dp[1][A[1]][1] = 1
end

MOD = 10 ** 4
2.upto(N) do |i|
  # 既に種類が決まっている場合
  kind = A[i]
  1.upto(3) do |j|
    next if kind != 0 && kind != j

    dp[i][j][2] += dp[i - 1][j][1] % MOD
    1.upto(3).each do |k|
      next if k == j

      1.upto(2) do |l|
        dp[i][j][1] += dp[i - 1][k][l] % MOD
      end
    end
  end
end

puts dp.last.flatten.sum % MOD
