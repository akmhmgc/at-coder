A, B, C, X, Y = gets.chomp.split.map(&:to_i)

ans = 10**20
# ABピザを買う枚数を変動させる
0.upto([X, Y].max) do |i|
  total = C * i * 2
  total += [(X - i), 0].max * A
  total += [(Y - i), 0].max * B
  ans = [ans, total].min
end

puts ans
