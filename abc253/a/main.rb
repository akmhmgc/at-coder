a, b, c = gets.chomp.split.map(&:to_i)

puts (a - b).abs <= (a - c).abs ? 'Yes' : 'No'
