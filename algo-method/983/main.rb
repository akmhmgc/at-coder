MOD = 998244353
def bfs(children, par, dp1, dp2)
  leaf = []
  # 各頂点の子供の数
  deg = Array.new(N, 0)

  N.times do |i|
    deg[i] = children[i].length
    leaf << i if deg[i] == 0
  end

  while leaf.length > 0
    v = leaf.shift

    children[v].each do |nv|
      dp1[v] *= dp2[nv] % MOD
      dp2[v] *= (dp1[nv] + dp2[nv]) % MOD
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

# dp1[v]:= vを根とする部分木のうちvを選んだ安定集合の組み合わせの数
# dp2[v]:= vを根とする部分木のうちvを選ばない安定集合の組み合わせの数
# dp1[v] = dp2[nv]
# dp2[v] = dp1[nv] + dp2[nv]

dp1 = Array.new(N, 1)
dp2 = Array.new(N, 1)

bfs(children, par, dp1, dp2)
puts [dp1, dp2].transpose.first.sum % MOD
