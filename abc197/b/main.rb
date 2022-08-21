@file = File.open('file.txt', 'r')

def gets
  @file.gets
end

h, w, x, y = gets.chomp.split.map(&:to_i)

x -= 1
y -= 1

masu = Array.new(h) { gets.chomp.split('') }

vac = [0, 1]

start = [x, y]
