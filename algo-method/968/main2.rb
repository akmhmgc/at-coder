N, M, S, T = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

been = Array.new(N, false)
# どの頂点から来たか
keiro = Array.new(N, -1)

queue = [S]

while !(v = queue.shift).nil?

  been[v] = true
  if v == T
    break
  end

  G[v].each do |v_next|
    next if  been[v_next] == true
    
    keiro[v] = v_next
    queue << v_next
  end
end

p keiro
