N = gets.to_i
G = []

N.times do
  u, k, *v = gets.chomp.split.map(&:to_i)
  G << v.map { |i| i -= 1 }
end

# それぞれ何手でいけるか
deg = Array.new(N, -1)
deg[0] = 0
que = [0]
visited = Array.new(N, false)
visited[0] = true


while !(v = que.shift).nil?
  G[v].each do |next_v|
    next if visited[next_v] == true

    deg[next_v] = deg[v] + 1
    que << next_v
    visited[next_v] = true
  end
end

deg.each_with_index{|deg, idx| puts "#{idx + 1} #{deg}"}
