N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }
deg = Array.new(N, 0)

M.times do
  f, s = gets.chomp.split.map(&:to_i)
  G[f] << s

  deg[s] += 1
end

# 取り除いた頂点の個数
n = 0
que = []

N.times do |i|
  next unless deg[i] == 0

  n += 1
  que << i
end

until (v = que.shift).nil?
  G[v].each do |next_v|
    deg[next_v] -= 1
    next if deg[next_v] != 0
    
    que << next_v 
    n += 1
  end
end

puts n == N ? 'Yes' : 'No' 
