require 'set'
N, Q = gets.chomp.split.map(&:to_i)
G = Array.new(N + 1) { Set.new }
C = Array.new(N + 1, 0)

(N - 1).times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

def dfs(v, val, been, been_v)
  return if been[v] == true

  been[v] = true
  been_v << v
  C[v] += val

  G[v].each do |v_next|
    dfs(v_next, val, been, been_v)
  end
end

Q.times do
  v, x = gets.chomp.split.map(&:to_i)
  been = Array.new(N + 1, false)
  been_v = Set.new
  dfs(v, x, been, been_v)
  G[v] += been_v
end

# 一回1からスタートしてグラフを作り直す？

p G

puts C[1..] * ' '
