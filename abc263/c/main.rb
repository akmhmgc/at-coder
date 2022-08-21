N,M = gets.chomp.split.map(&:to_i)

coms = (1..M).to_a.combination(N)

coms.each do |com|
  puts com.join(' ')
end
