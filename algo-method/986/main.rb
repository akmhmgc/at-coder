class Edge
  attr_reader :end_v, :length

  def initialize(e, length)
    @end_v = e
    @length = length
  end
end

N, M = gets.chomp.split.map(&:to_i)

G = Array.new(N) { [] }

M.times do
  u, v, w = gets.chomp.split.map(&:to_i)

  G[u] << Edge.new(v, w)
end

N.times do |i|
  puts G[i].min_by { |e| [e.length, e.end_v] }&.end_v || -1
end
