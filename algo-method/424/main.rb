H, W = gets.chomp.split.map(&:to_i)
X0, Y0, X1, Y1 = gets.chomp.split.map(&:to_i)

# 既に行ったことのあるマスを管理
dist = []

H.times do
  dist << gets.chomp.split('').map { |c| c == 'W' ? -1 : 10_000 }
end

dist = [[-1, -1, -1], [-1, 10000, -1], [-1, -1, -1]]

nodes = Array.new(H * W) { [] }
# 0手目
dist[X0][Y0] = 0
nodes[0] << [X0, Y0]

p dist

1.upto(H * W - 1) do |i|
  nodes[i - 1].each do |v|
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |vec|
      next_v = [v, vec].transpose.map { |a| a.inject(:+) }
      x,y = next_v

      next if x < 0 ||  y < 0 ||  x >= W || y >= W
      next if dist[x][y] != -1

      dist[x][y] = dist[v[0]][v[1]] + 1
      nodes[i] << next_v
    end
  end
end

puts dist[X1][Y1]
