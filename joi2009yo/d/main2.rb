W = gets.to_i
H = gets.to_i

G = Array.new(H) { gets.chomp.split.map(&:to_i) }

s = [0, 0]

VECS = [
  [-1, 0],
  [1, 0],
  [0, 1],
  [0, -1]
]

def dfs(x, y, been, count)
  return if x < 0 || y < 0 || x >= H || y >= W || been[x][y] == 0

  been[x][y] = 0
  count += 1
  @max = [@max, count].max

  VECS.each do |dx, dy|
    nx = x + dx
    ny = y + dy
    dfs(nx, ny, been, count)
  end
  been[x][y] = 1
end

@max = 0
H.times do |i|
  W.times do |j|
    been = []
    G.each do |line|
      been << line.dup
    end
    dfs(i, j, been, 0)
  end
end

puts @max
