N, K = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

# dp[i][j]: 残りi個数でプレーヤーj(1:takahasi, 0:aoki)の時点でtakahasiが取れる最大の石の数
dp = Array.new(N + 1) { [-10**20, -10**20] }

# 残り0個の時
dp[0] = [0, 0]

1.upto(N) do |i|
  # takahasiは最大を狙う
  arr = []
  A.map do |a|
    next if i < a
    
    arr << dp[i-a][0] + a
  end 
  dp[i][1] = arr.max
  
  # aokiは高橋が最小になるように動く
  arr2 = []
  A.map do |a|
    next if i < a

    arr2 << dp[i-a][1]
  end
  dp[i][0] = arr2.min
end

puts dp.last[1]
