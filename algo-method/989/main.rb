N, M = gets.chomp.split.map(&:to_i)

MOD = 10**9
D = []

N.times do |i|
  D << Array.new(N, MOD)
  D[i][0] = 0
end

U = []
M.times do
  u, v, w = gets.chomp.split.map(&:to_i)
  U << [u,v,w]
end

N.times do |i|
  U.each do |u,v,w|
    D[i][v] = [D[i-1][u] + w, D[i][v]].min
  end
end

puts D[-1] == D[-2] ? 'No' : 'Yes'

