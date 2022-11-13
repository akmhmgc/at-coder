N, M = gets.chomp.split.map(&:to_i)

G = Array.new(N + 1){[]}
C = Array.new(N + 1, 0)

M.times do 
  a,b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
  C[a] += 1
  C[b] += 1
end

G.map(&:sort!)

1.upto(N) do |i|
  line = []
  line.push(C[i])
  line.push(*G[i])
  puts line * ' '
end
