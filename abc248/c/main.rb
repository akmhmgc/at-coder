N, M, K = gets.chomp.split.map(&:to_i)

waru = 998_244_353
# i個の数字を選択していて合計がjの組み合わせ
dp = Array.new(51) { Array.new(3000, 0) }
dp[0][0] = 1

1.upto(N) do |i|
  (K + 1).times do |j|
    # 毎回dp(i,j) = の形式だとは限らない 
    1.upto(M).each { |nxt| dp[i][j + nxt] += dp[i - 1][j] }
  end
end

puts dp[N][1..K].sum % waru
