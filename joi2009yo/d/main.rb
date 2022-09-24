W = gets.to_i
H = gets.to_i
G = []

H.times do
  line = gets.chomp.split.map(&:to_i).map(&:zero?)
  line.unshift(true)
  line << true
  G << line
end
G.unshift(Array.new(W + 2, true))
G << Array.new(W + 2, true)

VEC = [
  [1, 0],
  [0, -1],
  [-1, 0],
  [0, 1]
]

def dfs(x, y, been, count)
  return if been[x][y] == true

  been[x][y] = true
  count += 1

  VEC.each do |d_x, d_y|
    x_next = x + d_x
    y_next = y + d_y
    dfs(x_next, y_next, been, count)
  end
  been[x][y] = false

  @max = [count, @max].max
end

@max = 0

(H + 2).times do |i|
  (W + 2).times do |j|
    been = Marshal.load(Marshal.dump(G))
    dfs(i, j, been, 0)
  end
end

puts @max


