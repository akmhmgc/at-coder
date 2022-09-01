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


while !(v = que.shift).nil?
  G[v].each do |next_v|
    next if deg[next_v] != -1

    deg[next_v] = deg[v] + 1
    que << next_v
  end
end

deg.each_with_index{|deg, idx| puts "#{idx + 1} #{deg}"}
