N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

G.map(&:sort!)

@order = []

def rec(v, been)
  been[v] = true

  G[v].each do |v2|
    next if been[v2] == true

    rec(v2, been)
  end
  @order << v
end

been = Array.new(N, false)

0.upto(N - 1) do |i|
  next if been[i] == true

  rec(i, been)
  p "スタート: #{i}"
  p @order
end

puts @order.reverse * ' '
