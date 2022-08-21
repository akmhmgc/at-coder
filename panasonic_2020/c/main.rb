a, b, c = gets.chomp.split.map(&:to_i)

puts c - a - b >= 0 && (c - a - b)**2 - 4 * a * b > 0 ? 'Yes' : 'No'
