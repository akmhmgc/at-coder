def bfs(s_v, children, ischosen)
  count = 0
  # 根
  que = [s_v]
  while que.length > 0
    v = que.shift

    # 子頂点を追加
    que.push(*children[v])

    next if ischosen[v] == true

    # 子の合計と親を比較
    child_val = children[v].reduce(0) { |result, item| result + W[item] }
    self_val =  W[v]

    if self_val >= child_val
      count += self_val
      ischosen[v] = true
    else
      count += child_val
      children[v].each { |v| ischosen[v] = true }
    end
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

W = gets.chomp.split.map(&:to_i)

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
puts bfs(r, children, ischosen)
