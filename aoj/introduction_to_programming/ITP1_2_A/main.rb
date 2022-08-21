@file = File.open('file.txt', 'r')

def gets
  @file.gets
end

n = gets.to_i

v1 = gets.chomp.split.map(&:to_i)
v2 = gets.chomp.split.map(&:to_i)


d1 = 0
n.times do |i|
  d1 += (v1[i] - v2[i]).abs
end


