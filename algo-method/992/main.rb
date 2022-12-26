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

prev_v = []
N.times {|i| prev_v << i}
D = Array.new(N) { [0] + Array.new(N - 1, Float::INFINITY) }

N.times do |i|
  M.times do |j|
    v = V[j]
    u = U[j]
    w = W[j]
    if D[i][v] > D[i - 1][u] + w
      D[i][v] = D[i - 1][u] + w
      prev_v[v] = u
    end
  end
end

# 復元
que = [N-1]

reverse = []

while que.length > 0
  v = que.shift
  reverse << v
  nv = prev_v[v]
  break if nv == 0

  que << nv
end

reverse << 0

puts reverse.length
puts reverse.reverse * ' '
