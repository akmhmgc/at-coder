H, W = gets.chomp.split.map(&:to_i)

whites = 0
G = []
H.times do
  line = gets.chomp.split('')
  G << line
  whites += line.count('.')
end

been = Array.new(H) { Array.new(W, 0) }
been[0][0] = 1
que = [[0, 0]]

VECS = [
  [-1, 0],
  [1, 0],
  [0, -1],
  [0, 1]
]

while true
  v = que.shift
  break if v.nil?

  x, y = v

  VECS.each do |dv|
    dx, dy = dv
    nx = x + dx
    ny = y + dy

    next if nx < 0 || ny < 0 || nx >= H || ny >= W || G[nx][ny] == '#' || been[nx][ny] != 0

    been[nx][ny] = been[x][y] + 1
    que << [nx, ny]
  end
end

puts (count = been.last.last).zero? ? -1 : whites - count
