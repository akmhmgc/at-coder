W, H = gets.chomp.split.map(&:to_i)
G = []
G << Array.new(W + 2, 0)
H.times do
  row = gets.chomp.split.map(&:to_i)
  row.unshift(0)
  row << 0
  G << row
end

G << Array.new(W + 2, 0)

# 移動できる方向
e_vecs = [
  [-1, -1],
  [0, -1],
  [1, 0],
  [0, 1],
  [-1, 1],
  [-1, 0]
]
o_vecs = [
  [1, -1],
  [1, 0],
  [1, 1],
  [0, 1],
  [-1, 0],
  [0, -1]
]

illumination = 0

que = [[0, 0]]
G[0][0] = -1

until (v = que.shift).nil?
  vecs = v[0].even? ? e_vecs : o_vecs
  vecs.each do |vec|
    v2,v1 = vec
    x, y = [v, [v1, v2]].transpose.map { |a| a.inject(:+) }

    next if x < 0 || y < 0 || x >= H + 2 || y >= W + 2 || G[x][y] == -1

    # 建物と隣接している場合はイルミネーションを増やす
    if G[x][y] == 1
      illumination += 1
    else
      que << [x, y]
      G[x][y] = -1
    end
  end
end

puts illumination

