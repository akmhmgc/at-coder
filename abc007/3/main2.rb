R, C = gets.chomp.split.map(&:to_i)
S = gets.chomp.split.map(&:to_i).map { |i| i - 1 }
E = gets.chomp.split.map(&:to_i).map { |i| i - 1 }
G = Array.new(R) { gets.chomp.split('').map { |i| i == '.' ? 0 : 1 } }

VECS = [
  [-1, 0],
  [1, 0],
  [0, -1],
  [0, 1]
]

que = []
que << S

while true
  v = que.shift
  break if v.nil?

  x, y = v

  VECS.each do |dx, dy|
    nx = x + dx
    ny = y + dy

    next if G[nx][ny] != 0

    G[nx][ny] = G[x][y] + 1
    que << [nx, ny]
  end
end

gx,gy = E

puts G[gx][gy]
