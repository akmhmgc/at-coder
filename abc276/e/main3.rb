def dfs(x, y, gx, gy, used)
  return true if x == gx && y == gy
  4.times do |i|
      used[y][x] = true
      ny, nx = y + DY[i], x + DX[i]
      next if nx < 0 || ny < 0 || nx >= W || ny >= H
      next if C[ny][nx] != "."
      next if used[ny][nx]
      return true if dfs(nx, ny, gx, gy, used)
  end
  return false
end

H, W = gets.split.map(&:to_i)
C = H.times.map{ gets.chomp.chars }
sx = 0
sy = 0
H.times do |i|
  W.times do |j|
      if C[i][j] == "S"
          sy = i
          sx = j
      end
  end
end

DY = [1, -1, 0, 0]
DX = [0, 0, 1, -1]
cell = []
4.times do |i|
  x = sx + DX[i]
  y = sy + DY[i]
  if x >= 0 && y >= 0 && x < W && y < H
      if C[y][x] == "."
          cell << [x, y]
      end
  end
end

cell.combination(2).each do |a, b|
  used = Array.new(H){ Array.new(W, false) }
  if dfs(a[0], a[1], b[0], b[1], used)
      puts "Yes"
      exit
  end
end
puts "No"
