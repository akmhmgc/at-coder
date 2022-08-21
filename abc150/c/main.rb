N = gets.to_i
P = gets.chomp.split.map(&:to_i)
Q = gets.chomp.split.map(&:to_i)

a = 0
b = 0
(1..N).to_a.permutation(N).each_with_index do |i, idx|
  a = idx if i == P
  b = idx if i == Q
end

puts (a - b).abs
