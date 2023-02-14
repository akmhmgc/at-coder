H, W = gets.chomp.split.map(&:to_i)
G = []
G << Array.new(H + 2, 0)
W.times do
  G << [0, *gets.chomp.split.map(&:to_i), 0]
end
G << Array.new(H + 2, 0)

vec = [
  [1, 0],
  [-1, 0],
  [0, 1],
  [0, -1]
]

odd_vec = [
  *vec,
  [-1, 1],
  [1, 1]
]

even_vec = [
  *vec,
  [-1, -1],
  [1, -1]
]

que = [[0, 0]]
G[0][0] = -1

count = 0
while true
  v = que.shift
  break if v.nil?

  x, y = v

  vecs = x.odd? ? odd_vec : even_vec
  vecs.each do |dv|
    dx, dy = dv
    nx = x + dx
    ny = y + dy

    next if nx < 0 || ny < 0 || nx >= W + 2 || ny >= H + 2 || G[nx][ny] == -1

    if G[nx][ny] == 1
      count += 1
      next
    end

    G[nx][ny] = -1

    que << [nx, ny]
  end
end

puts count
