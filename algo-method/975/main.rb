N = gets.to_i
G = Array.new(N) { [] }

(N - 1).times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

max = 0

N.times do |s|
  dist = Array.new(N, -1)
  que = [s]
  dist[s] = 0

  while true
    break if (v = que.shift).nil?

    G[v].each do |v2|
      next if dist[v2] != -1

      dist[v2] = dist[v] + 1
      que << v2
    end
  end
  max = [dist.max, max].max
end

puts max
