n, k = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)
b = gets.chomp.split.map(&:to_i)

diff = [a, b].transpose.inject(0) { |res, item| res + (item[0] - item[1]).abs }

if (k - diff) >= 0 && ((k - diff) % 2).zero?
  puts 'Yes'
else
  puts 'No'
end
