R, C = gets.chomp.split.map(&:to_i)
Sx, Sy = gets.chomp.split.map(&:to_i).map { |i| i -= 1 }
Gx, Gy = gets.chomp.split.map(&:to_i).map { |i| i -= 1 }

G = []
R.times do
  c = gets.chomp.split('').map { |m| m == '#' ? -1 : 0 }
  G << c
end

que = []
que << [Sx, Sy]

until (v = que.shift).nil?
  [[1, 0], [0, 1], [-1, 0], [0, -1]].each do |vec|
    x, y = [v, vec].transpose.map { |a| a.inject(:+) }
    next if G[x][y] != 0 || x < 0 || y < 0 || x >= R || y >= C

    G[x][y] = G[v[0]][v[1]] + 1
    que << [x, y]
  end
end

puts G[Gx][Gy]
