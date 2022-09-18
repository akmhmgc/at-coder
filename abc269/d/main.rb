N = gets.to_i
G = Array.new(2100) { Array.new(2100, true) }

N.times do
  x, y = gets.chomp.split.map { |a| a.to_i + 1000 }
  G[x][y] = false
end

VECS = [
  [-1, -1],
  [-1, 0],
  [0, -1],
  [0, 1],
  [1, 0],
  [1, 1]
]

def rec(x, y)
  G[x][y] = true

  VECS.each do |x_d, y_d|
    x_next = x + x_d
    y_next = y + y_d
    next if G[x_next][y_next] == true

    rec(x_next, y_next)
  end
end

count = 0
2001.times do |i|
  2001.times do |j|
    next if  G[i][j] == true

    count += 1
    rec(i, j)
  end
end


puts count
