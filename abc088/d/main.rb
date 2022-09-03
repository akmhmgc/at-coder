# start: スタート地点の配列
# graph: 二次元配列（0は移動可能、-1は不可能）
def bfs_arr_2(start, graph)
  que = [start]
  until (v = que.shift).nil?
    [[1, 0], [0, 1], [-1, 0], [0, -1]].each do |vec|
      x, y = [v, vec].transpose.map { |a| a.inject(:+) }
      next if x < 0 || y < 0 || x >= H || y >= W || graph[x][y] != 0
      que << [x, y]
      graph[x][y] = graph[v[0]][v[1]] + 1
    end
  end
  graph
end


H, W = gets.chomp.split.map(&:to_i)
G = []
black = 0
H.times do
  row = gets.chomp.split('').map { |d| d == '#' ? -1 : 0 }
  G << row
  black += row.count(-1)
end


g = bfs_arr_2([0,0], G)

puts g.last.last == 0 ? -1 : H * W - black - (g.last.last + 1)
