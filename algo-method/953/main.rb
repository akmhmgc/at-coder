N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

@been = Array.new(N, false)

def rec(v)
  @been[v] = true
  G[v].each do |next_v|
    next if @been[next_v] == true

    rec(next_v)
  end
end

rec(0)

puts @been.count(false)
