@file = File.open('file.txt', 'r')

def gets
  @file.gets
end

#  = gets.chomp.split.map(&:to_i)
#  = gets.chomp.split.map(&:to_i)
# = gets.to_i
a, b = gets.chomp.split.map(&:to_i)


if a > b
  puts 'a > b'
elsif a < b
  puts 'a < b'
else
  puts 'a == b'
end
