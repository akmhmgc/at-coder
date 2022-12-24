N, M = gets.chomp.split.map(&:to_i)

INF = Float::INFINITY
D = []

N.times do |i|
  D << Array.new(N, INF)
  D[i][0] = 0
end

G = Array.new(N){[]}
U = []
M.times do
  u, v, w = gets.chomp.split.map(&:to_i)
  U << [u, v, w]
  G[u] << v
end

N.times do |i|
  U.each do |u, v, w|
    D[i][v] = [D[i - 1][u] + w, D[i][v]].min
  end
end

def bfs(v, been)
  que = [v]

  while !que.empty?
    v = que.shift

    G[v].each do |nv|
      next if been[nv] == true

      been[nv] = true
      que << nv
    end
  end
end

if D.last.last == INF
  puts 'impossible'
  exit
end

if D[-1] == D[-2]
  puts D.last.last
else
  # 負閉路に含まれるnode
  nodes = []
  N.times do |i|
    next if D[-1][i] == D[-2][i]
    nodes << i
  end

  nodes.each do |node|
    been = Array.new(N, false)
    bfs(node,been)
    if been.last == true
      puts '-inf'
      exit
    end
  end
  puts D.last.last
end

