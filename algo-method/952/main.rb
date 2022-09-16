N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

G.map(&:sort!)

@seen = Array.new(N, false)

def rec(v)
  @seen[v] = true
  print "#{v} "

  G[v].each do |next_v|
    next if @seen[next_v] == true

    rec(next_v)
  end
end


rec(0)
