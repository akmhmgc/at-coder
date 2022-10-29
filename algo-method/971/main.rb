N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }
deg = Array.new(N, 0)

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[b] << a
  # deg[v]: vを頂点とする出次数
  deg[a] += 1
end

que = []
0.upto(N - 1) do |i|
  que << i if deg[i] == 0
end

order = []

# queにトポロジカルソートの末端となりうる頂点が入っている
until (v = que.shift).nil?
  order << v
  G[v].each do |v2|
    deg[v2] -= 1
    p deg
    que << v2 if deg[v2] == 0
  end
end

puts order.length == N ? 'No' : 'Yes'
