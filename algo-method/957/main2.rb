N, M, S, T = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

been = Array.new(N, false)

queue = [S]

while !(v = queue.shift).nil?
  next if been[v] == true

  been[v] = true
  if v == T
    puts 'Yes'
    exit
  end


  queue.append(*G[v])
end

puts 'No'

