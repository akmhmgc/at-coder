a, b, c = gets.chomp.split.map(&:to_i)

puts (c**b - a).positive? ? 'Yes' : 'No'
