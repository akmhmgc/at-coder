N, Q = gets.chomp.split.map(&:to_i)

G = Array.new(N + 1) { [] }
(N - 1).times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

C = Array.new(N + 1, 0)

Q.times do
  point, x = gets.chomp.split.map(&:to_i)
  C[point] += x
end

been = Array.new(N + 1, false)

def dfs(v, been, point)
  return if been[v] == true
  
  been[v] = true
  C[v] += point

  G[v].each do |nv|
    dfs(nv, been, C[v])
  end
end

dfs(1, been, 0)

puts C[1..-1] * ' '
