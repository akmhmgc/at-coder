N = gets.to_i
P = gets.chomp.split.map(&:to_i)
Q = gets.chomp.split.map(&:to_i)

orders = []
[*1..N].permutation(N).with_index do |com, idx|
  orders << idx if [P, Q].include?(com)
end

a, b = orders
puts b.nil? ? 0 : (a - b).abs
