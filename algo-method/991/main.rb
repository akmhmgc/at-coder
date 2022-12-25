N, M = gets.chomp.split.map(&:to_i)
U = []
V = []
W = []

M.times do
  u, v, w = gets.chomp.split.map(&:to_i)
  U << u
  V << v
  W << w
end

D = Array.new(N) { [0] + Array.new(N - 1, Float::INFINITY * -1) }

N.times do |i|
  M.times do |j|
    v = V[j]
    u = U[j]
    w = W[j]
    D[i][v] = [D[i][v], D[i - 1][u] + w].max
  end
end

puts D.last.last
