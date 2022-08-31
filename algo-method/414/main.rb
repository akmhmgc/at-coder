M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

# 行った場所
dist = Array.new(N, -1)

# k手目に探索された場所
nodes = Array.new(N) { [] }

# 0手目
dist[0] = 0
nodes[0] = [0]

1.upto(N - 1) do |k|
  # 一個前に調べた頂点に対して
  nodes[k-1].each do |v|
    # 頂点からたどれる場所を見る
    G[v].each do |next_v|
      next if dist[next_v] != -1

      # 各頂点に何手目で到達したか
      # 今回の問題では dist[v] + 1ではなくて1でも別にOK
      dist[next_v] = dist[v] + 1

      nodes[k] << next_v
    end
  end
end

puts nodes.map{|node| node.sort.join(' ')}
