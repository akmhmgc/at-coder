N, M = gets.chomp.split.map(&:to_i)

INF = Float::INFINITY
D = []

N.times do |i|
  D << Array.new(N, INF)
  D[i][0] = 0
end

G = Array.new(N){[]}
U = []
M.times do
  u, v, w = gets.chomp.split.map(&:to_i)
  U << [u, v, w]
  G[u] << v
end

N.times do |i|
  U.each do |u, v, w|
    D[i][v] = [D[i - 1][u] + w, D[i][v]].min
  end
end

if D.last.last == INF
  puts 'impossible'
  exit
end

if D[-1] == D[-2]
  puts D.last.last
  exit
else
  N.times do |i|
    next if D[-1][i] == D[-2][i]
    
    D[-1][i] = INF * (-1)
  end
end

N.times do 
  D << D[-1]
end

N.upto(2*N - 1) do |i|
  U.each do |u, v, w|
    D[i][v] = [D[i - 1][u] + w, D[i][v]].min
  end
end

puts D.last.last == -1 * INF ? '-inf' : D.last.last
