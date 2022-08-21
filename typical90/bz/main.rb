N, M = gets.chomp.split.map(&:to_i)

# それぞれの頂点に隣接する自信より小さい点
dots = Array.new(N, 0)

M.times do
  dots[gets.chomp.split.map(&:to_i).sort.reverse.first - 1] += 1
end

puts dots.count(1)
