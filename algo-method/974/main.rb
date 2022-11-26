N = gets.to_i
G = Array.new(N){[]}

(N-1).times do 
  a,b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end


dist = Array.new(N, -1)
que = [0]
dist[0] = 0

while true
  break if (v = que.shift).nil?

  G[v].each do |v2|
    next if dist[v2] != -1 
    dist[v2] = dist[v] + 1
    que << v2
  end
end

puts dist.max
