@file = File.open('file.txt', 'r')

def gets
  @file.gets
end

#  = gets.chomp.split.map(&:to_i)
#  = gets.chomp.split.map(&:to_i)
# = gets.to_i

S = gets.to_i

h = S / (60 * 60)

amari = S % (60 * 60)

m = amari / 60

amari = amari % 60

s = amari

puts [h, m, s].join(':')
