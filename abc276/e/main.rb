H, W = gets.chomp.split.map(&:to_i)
S = []
WALL = Array.new(H) { Array.new(W, false) }

H.times do |i|
  line = gets.chomp.split('')
  line.each_with_index do |item, j|
    case item
    when 'S'
      S = [i, j]
      WALL[i][j] = true
    when '#'
      WALL[i][j] = true
    end
  end
end

# 移動の組み合わせ
VECS = [
  [1, 0],
  [0, 1],
  [0, -1],
  [-1, 0]
]


def rec(v, been, goal)
  p v
  x,y = v
  return false if been[x][y] == true
  return true if v == goal

  been[x][y] = true
  
  VECS.each do |dv|
    x2 = x + dv[0] 
    y2 = y + dv[1]
    
    next if x2 < 0 || x2 >= H || y2 < 0 || y2 >= W
    v2 = [x2, y2]
    

    rec(v2, been, goal)
  end
  return false
end


flag = false
VECS.combination(2).each do |d1,d2|
  p1 = [S,d1].transpose.map{|d| d.inject(:+)}
  p2 = [S,d2].transpose.map{|d| d.inject(:+)}

  next if x2 < 0 || x2 >= H || y2 < 0 || y2 >= W
  next if x1 < 0 || x1 >= H || y1 < 0 || y1 >= W
  next if WALL[x1][y1] == true
  next if WALL[x2][y2] == true

  been = Marshal.load(Marshal.dump(WALL)) 
  if rec(p1, been, p2) == true
    p 'hogehoge'
  end
end

puts flag ? 'Yes' : 'No'
