N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

# 頂点iに何回で到達するか
dist = Array.new(N, -1)

# k手目に探索された頂点
nodes = Array.new(N) { [] }

# 0手目
dist[0] = 0
nodes[0] = [0]

1.upto(N-1) do |i|
  nodes[i-1].each do |v|
    G[v].each do |next_v|
      next if dist[next_v] != -1

      dist[next_v] = dist[v] + 1
      nodes[i] << next_v
    end
  end
end

p nodes
p dist
