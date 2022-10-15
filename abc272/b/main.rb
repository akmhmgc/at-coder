N,M = gets.chomp.split.map(&:to_i)

A = Array.new(N){Array.new(N, false)}

N.times do |i|
  A[i][i] = true
end

M.times do
  k, *x = gets.chomp.split.map(&:to_i)
  x.permutation(2).each do |a,b|
    a -= 1
    b -= 1
    A[a][b] = true
    A[b][a] = true
  end
end

flag = true

N.times do |i|
  N.times do |j|
    next if A[i][j] == true

    flag = false
  end
end

puts flag ? 'Yes' : "No"
