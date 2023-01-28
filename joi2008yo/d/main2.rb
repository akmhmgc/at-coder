require 'set'
N = gets.to_i
A = Array.new(N) { gets.chomp.split.map(&:to_i) }
M = gets.to_i
B = Array.new(M) { gets.chomp.split.map(&:to_i) }

setB = B.to_set

# 移動しうる座標
V = []
x0, y0 = A.first

B.each do |bi|
  x1, y1 = bi
  V << [x1 - x0, y1 - y0]
end

V.each do |v|
  flag = true
  dx, dy = v
  A.each do |ai|
    x, y = ai
    flag = false unless setB.include?([x + dx, y + dy])
  end
  if flag == true
    puts v * ' '
    exit
  end
end
