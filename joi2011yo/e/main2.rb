H, W, N = gets.chomp.split.map(&:to_i)
G = Array.new(H + 2) { Array.new(W + 2, 0) }
S = Array.new(N + 1)

H.times do |i|
  line = gets.chomp.split('')
  line.each_with_index do |v, j|
    S[0] = [i + 1, j + 1] if v == 'S'
    S[v.to_i] = [i + 1, j + 1] if v.to_i > 0
    G[i + 1][j + 1] = -1 if v == 'X'
  end
end

(H + 2).times do |i|
  (W + 2).times do |j|
    G[i][j] = -1 if i == 0 || i == H + 1
    G[i][0] = -1
    G[i][-1] = -1
  end
end

VECS = [
  [-1, 0],
  [1, 0],
  [0, -1],
  [0, 1]
]
def bfs(s, g)
  graph = Marshal.load(Marshal.dump(G))
  sx, sy = s
  gx, gy = g
  que = [s]

  while true
    v = que.shift
    break if v == nil
    x, y = v

    VECS.each do |dx, dy|
      nx = x + dx
      ny = y + dy
      next if graph[nx][ny] != 0

      graph[nx][ny] = graph[x][y] + 1
      que << [nx, ny]
    end
  end
  graph[gx][gy]
end

count = 0
N.times do |i|
  s = S[i]
  g = S[i+1]
  count += bfs(s,g)
end

puts count
