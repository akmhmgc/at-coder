
def bfs(s, g, been, prev)
  queue = [s]
  until (v = queue.shift).nil?
    been[v] = true
    g[v].each do |v_next|
      next if been[v_next] == true
      prev[v_next] = v
      queue << v_next
    end
  end
end
N, M, S, T = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

been = Array.new(N, false)
prev = Array.new(N, -1)

bfs(S, G, been, prev)

order = []
now = T
while now != -1
  order.append(now)
  now = prev[now]
end

puts order.count
puts order.reverse * ' '
