N, M, S, T = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

been = Array.new(N, false)

queue = [[S]]

while !(keiro = queue.shift).nil?
  v = keiro.last
  next if been[v] == true

  been[v] = true
  if v == T
    puts keiro.count
    puts keiro * ' '
    exit
  end

  G[v].each do |v|
    queue << [*keiro, v]
  end
end
