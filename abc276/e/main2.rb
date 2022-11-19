def dfs(x, y, gx, gy, used)
  return true if x == gx && y == gy
  4.times do |i|
      used[x][y] = true
      ny, nx = y + DY[i], x + DX[i]
      next if nx < 0 || ny < 0 || nx >= H || ny >= W
      next if C[nx][ny] != "."
      next if used[nx][ny]
      return true if dfs(nx, ny, gx, gy, used)
  end
  return false
end

H, W = gets.chomp.split.map(&:to_i)
C = H.times.map { gets.chomp.chars }
sx = 0
sy = 0
H.times do |i|
  W.times do |j|
    if C[i][j] == 'S'
      sy = j
      sx = i
    end
  end
end

DY = [1, -1, 0, 0]
DX = [0, 0, 1, -1]

cell = []
4.times do |i|
  x = sx + DX[i]
  y = sy + DY[i]
  if x >= 0 && y >= 0 && x < H && y < W
      if C[x][y] == "."
          cell << [x, y]
      end
  end
end

cell.combination(2).each do |b, a|
  used = Array.new(H){ Array.new(W, false) }
  if dfs(a[0], a[1], b[0], b[1], used)
      puts "Yes"
      exit
  end
end

puts 'No'


kit_group = KitGroup.find(3589)

kits = kit_group.kits

kits.find_each do |kit|
  profiles = kit.user.organization_patient_user_profiles

  profiles.each do |profile|
    next if profile.organization_id != 529
    
    profile.update!(organization_id: 1636)
  end
end


kit_group = KitGroup.find(3589)
kits = kit_group.kits
kits.find_each do |kit|
  next unless kit.user

  profiles = kit.user.organization_patient_user_profiles
  profiles.each do |profile|
    next if profile.organization_id != 529
    
    profile.update!(organization_id: 1636)
  end
end
