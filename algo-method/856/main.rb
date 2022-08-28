N = gets.to_i
P = Array.new(3) { gets.chomp.split.map(&:to_i) }
dp = Array.new(N){Array.new(3, 0)}

1.upto(N-1) do |i|
  3.times do |j|
    dp[i][j] = (0..2).map{|k| dp[i-1][k] + (P[j][i]- P[k][i-1]).abs }.min
  end
end

puts dp.last.min
