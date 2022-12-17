class Edge
  attr_reader :end_v, :length

  def initialize(e, length)
    @end_v = e
    @length = length
  end
end

N, M = gets.chomp.split.map(&:to_i)



MOD = 10**9
D = Array.new(N, MOD)
D[0] = 0

G = Array.new(N) { [] }

M.times do
  u, v, w = gets.chomp.split.map(&:to_i)

  D[v] = [D[u] + w, D[v]].min
end

puts D
