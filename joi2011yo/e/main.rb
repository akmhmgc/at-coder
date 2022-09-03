H, W, N = gets.chomp.split.map(&:to_i)

que = []
G = []
points = {}
H.times do |r|
  row = []
  gets.chomp.split('').each_with_index do |v, idx|
    row << 0  if v == '.'
    row << -1 if v == 'X'
    if v.to_i > 0
      points[v.to_i] = [r, idx]
      row << 0
    end
    if v == 'S'
      points[0] = [r, idx]
      row << 0
    end
  end
  G << row
end

def bfs(s, g)
  dist = []
  G.map {|r| dist << r.dup }
  que = []
  que << s

  until (v = que.shift).nil?
    [[1, 0], [0, 1], [-1, 0], [0, -1]].each do |vec|
      x, y = [v, vec].transpose.map { |a| a.inject(:+) }
      next if x < 0 || y < 0 || x >= H || y >= W || dist[x][y] != 0

      que << [x, y]

      dist[x][y] = dist[v[0]][v[1]] + 1
      move = dist[x][y]
    end
  end
  dist[g[0]][g[1]]
end


step = 0
N.times do |i|
  step += bfs(points[i], points[i + 1])
end

puts step
