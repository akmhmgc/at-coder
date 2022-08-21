x1, y1, x2, y2 = gets.chomp.split.map(&:to_i)

distance = (x1 - x2)*(x1 - x2) + (y1 - y2)*(y1 - y2)

puts distance
