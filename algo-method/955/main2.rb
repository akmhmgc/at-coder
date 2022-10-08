H, W = gets.chomp.split.map(&:to_i)

G = []
H.times do
  line = gets.chomp.split('').map { |v| !(v == '#') }
  G << line
end

VECS = [
  [1, 0],
  [0, 1],
  [-1, 0],
  [0, -1]
]

def rec(x, y)
  return if G[x][y] == true

  G[x][y] = true

  VECS.each do |d_x, d_y|
    x_next = x + d_x
    y_next = y + d_y
    next if x_next < 0 || y_next < 0 || x_next >= H || y_next >= W

    rec(x_next, y_next)
  end
end

count = 0

H.times do |i|
  W.times do |j|
    next if G[i][j] == true

    rec(i, j)
    count += 1
  end
end

puts count
