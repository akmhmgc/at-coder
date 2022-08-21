n = gets.to_i

a = gets.chomp.split.map(&:to_i).sort
b = gets.chomp.split.map(&:to_i).sort


sum = 0

n.times do |i|
  sum+= (a[i] - b[i]).abs
end


puts sum
