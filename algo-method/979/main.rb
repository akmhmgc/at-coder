
def bfs(children, par, ischosen)
  leaf = []
  # 各頂点の子供の数
  deg = Array.new(N, 0)

  N.times do |i|
    deg[i] = children[i].length
    leaf << i if deg[i] == 0
  end

  while leaf.length > 0
    v = leaf.shift

    flg = false
    # 子と親がえらばれていなければ自分と親をえらぶ
    children[v].each do |nv|
      flg ||= ischosen[v]
    end
    flg ||= ischosen[par[v]]

    # 子と親が選ばれていない場合
    if flg == false

      ischosen[v] = true
      ischosen[par[v]] = true
    end

    # 親頂点を取得
    point = par[v]
    deg[point] -= 1
    leaf << point if deg[point] == 0
  end
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

ischosen = Array.new(N, false)
bfs(children, par, ischosen)

puts ischosen.count(true) / 2
