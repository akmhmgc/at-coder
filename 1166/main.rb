def can_go(v, dv, graph, w, h)
  x, y = v
  dx, dy = dv

  nx = x + dx
  ny = y + dy

  return false if nx < 0 || ny < 0 || nx >= h || ny >= w

  case dv
  when [1, 0]
    graph[2 * x + 1][y] == 0
  when [-1, 0]
    graph[2 * x - 1][y] == 0
  when [0, 1]
    graph[2 * x][y] == 0
  when [0, -1]
    graph[2 * x][y - 1] == 0
  end
end

VECS = [
  [-1, 0],
  [1, 0],
  [0, 1],
  [0, -1]
]

while true
  w, h = gets.chomp.split.map(&:to_i)
  break if w == 0 && h == 0

  graph = []
  (2 * h - 1).times do
    graph << gets.chomp.split.map(&:to_i)
  end

  been = Array.new(h) { Array.new(w, 0) }
  been[0][0] = 1
  que = [[0, 0]]

  while true
    v = que.shift
    x, y = v
    break if v.nil?

    VECS.each do |dv|
      next unless can_go(v, dv, graph, w, h)

      dx, dy = dv
      nx = x + dx
      ny = y + dy
      next if been[nx][ny] != 0

      been[nx][ny] = been[x][y] + 1
      que << [nx, ny]
    end
  end
  puts been.last.last
end
