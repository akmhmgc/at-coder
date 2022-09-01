H, W = gets.chomp.split.map(&:to_i)
X0, Y0, X1, Y1 = gets.chomp.split.map(&:to_i)

dist = []

H.times do
  dist << gets.chomp.split('').map { |c| c == 'W' ? -1 : 10_000 }
end

nodes = []
# 0手目
dist[X0][Y0] = 0
nodes << [X0, Y0]

until (v = nodes.shift).nil?
  [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |vec|
    next_v = [v, vec].transpose.map { |a| a.inject(:+) }
    x, y = next_v

    next if x < 0 || y < 0 || x >= H || y >= W
    next if dist[x][y] != -1

    dist[x][y] = dist[v[0]][v[1]] + 1
    nodes << next_v
  end
end

puts dist[X1][Y1]
