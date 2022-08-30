require 'set'

N, M, X = gets.chomp.split.map(&:to_i)
exit if M == 0

follows = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  follows[a] << b
  follows[b] << a
end

# 自分自身と直接の友人
mabu = Set.new(follows[X] << X)

friends = Set.new()
follows[X].each do |mabu|
  friends+= follows[mabu]
end

p friends
