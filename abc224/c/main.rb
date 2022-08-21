n = gets.to_i

dots = []

n.times do
  dots << gets.chomp.split.map(&:to_i)
end

# 3点の組み合わせ
coms = dots.combination(3).to_a

count = 0

coms.each do |com|
  p1, p2, p3 = com
  x1, y1 = p1
  x2, y2 = p2
  x3, y3 = p3

  next if (y2 - y1) * (x3 - x2) == (y3 - y2) * (x2 - x1)

  count+= 1
end

puts count
