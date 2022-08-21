require 'set'

N, M = gets.chomp.split.map(&:to_i)

dots = Array.new(N + 1) { Set.new }

M.times do
  u, v = gets.chomp.split.map(&:to_i)
  dots[u] << v
  dots[v] << u
end

count = 0

1.upto(N) do |a|
  (a + 1).upto(N).each do |b|
    (b + 1).upto(N).each do |c|
      next if !(dots[a].include?(b) && dots[a].include?(c))
      next if !(dots[b].include?(a) && dots[b].include?(c))
      next if !(dots[c].include?(b) && dots[c].include?(a))

      count += 1
    end
  end
end

puts count
