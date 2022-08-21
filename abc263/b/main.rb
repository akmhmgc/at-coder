N = gets.to_i
P = gets.chomp.split.map(&:to_i)

generation = 0

i = N

while i != 1
  i = P[i - 2]
  generation += 1
end

puts generation
