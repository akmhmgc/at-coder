
def bfs(children, par, is_covered)
  leaf = []
  # 各頂点の子供の数
  deg = Array.new(N, 0)

  N.times do |i|
    deg[i] = children[i].length
    leaf << i if deg[i] == 0
  end

  count = 0
  while leaf.length > 0
    v = leaf.shift

    # 自分がカバーされていなければ自分と親をカバーする
    p_v = par[v]
    if is_covered[v] == false
      is_covered[v] = true
      is_covered[p_v] = true
      count += 1
    end
    
    # 親頂点を取得
    point = par[v]
    deg[point] -= 1
    leaf << point if deg[point] == 0
  end
  count
end

N = gets.to_i
G = Array.new(N) { [] }

(N - 1).times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

r = 0
children = Array.new(N) { [] }

par = Array.new(N, 0)
seen = Array.new(N, false)
que = []

seen[r] = true
par[r] = r
que << r


while que.length > 0
  v = que.shift
  G[v].each do |nv|
    next if seen[nv] == true
    
    seen[v] = true
    children[v] << nv
    par[nv] = v
    que << nv
  end
end

is_covered = Array.new(N, false)
count = bfs(children, par, is_covered)

puts count
