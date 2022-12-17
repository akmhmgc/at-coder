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

U = []
M.times do
  u, v, w = gets.chomp.split.map(&:to_i)
  U << [u,v,w]
end

count = 0
while
  count += 1
  change = false
  U.each do |u,v,w|
    if D[u] + w < D[v]
      D[v] = D[u] + w
      change = true
    end
  end
  break unless change
end

puts count

