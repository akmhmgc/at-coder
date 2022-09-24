N, Q = gets.chomp.split.map(&:to_i)
G = Array.new(N + 1) { [] }
C = Array.new(N + 1, 0)

(N - 1).times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

@been = Array.new(N + 1, false)

P = Array.new(N + 1, 0)
Q.times do
  po, x = gets.chomp.split.map(&:to_i)
  P[po] += x
end

def dfs(v, point)
  return if @been[v] == true

  @been[v] = true
  point += P[v]

  C[v] = point

  G[v].each do |v_next|
    dfs(v_next, point)
  end
end

dfs(1, 0)

puts C[1..] * ' '
