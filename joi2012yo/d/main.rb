N, K = gets.chomp.split.map(&:to_i)

# i日目
# jのメニュー
# k+1日連続
dp = Array.new(N) { Array.new(3) { Array.new(2, -1) } }

# 初日のメニュー
dp[0] = [[1, 0], [1, 0], [1, 0]]

K.times do
  a, b = gets.chomp.split.map(&:to_i).map{|i| i -1}
  menu = [0, 1, 2]
  menu.delete(b)

  menu.each do |d_menu|
    dp[a][d_menu] = [0, 0]
  end
end

1.upto(N-1) do |i|
  3.times do |j|
    next if dp[i][j][0] == 0 || dp[i][j][1] == 0

    others = [0,1,2] - [j]
    dp[i][j][1] = dp[i-1][j][0]
    dp[i][j][0] = others.map{|o_mn| dp[i-1][o_mn].sum }.sum
  end
end

puts dp.last.flatten.sum % 10000
