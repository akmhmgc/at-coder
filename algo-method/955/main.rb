H, W = gets.chomp.split.map(&:to_i)

G = Array.new(H) do
  gets.chomp.split('').map { |mark| mark == '.' }
end

VECS = [
  [-1, 0],
  [0, 1],
  [0, -1],
  [1, 0]
]

ans = 0

def rec(i, j)
  G[i][j] = true

  VECS.each do |d_i, d_j|
    i_next = i + d_i
    j_next = j + d_j

    next if i_next < 0 || i_next >= H || j_next < 0 || j_next >= W || G[i_next][j_next] == true

    rec(i_next, j_next)
  end
end

ans = 0

H.times do |i|
  W.times do |j|
    next if G[i][j] == true

    rec(i, j)
    ans += 1
  end
end

puts ans
