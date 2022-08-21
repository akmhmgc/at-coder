L1, R1, L2, R2 = gets.chomp.split.map(&:to_i)

list = Array.new(100, 0)

L1.upto(R1 - 1) do |i|
  list[i] += 1
end

L2.upto(R2 - 1) do |i|
  list[i] += 1
end

puts list.count(2)

