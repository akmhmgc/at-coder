N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }
deg = Array.new(N, 0)

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[b] << a
  deg[a] += 1
end

G.map(&:sort!)

que = []

0.upto(N - 1) do |i|
  que << i if deg[i] == 0
end

order = []
while (v = que.shift) != nil
  order << v
  G[v].each do |v_next|
    deg[v_next] -= 1

    que << v_next if deg[v_next] == 0
  end
end

puts order.reverse * ' '
