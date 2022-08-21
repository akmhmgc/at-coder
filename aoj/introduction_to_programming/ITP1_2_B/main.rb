@file = File.open('file.txt', 'r')

def gets
  @file.gets
end

x1, y1, x2, y2 = gets.chomp.split.map(&:to_f)

distance = Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))

puts format('%.5f', distance)
