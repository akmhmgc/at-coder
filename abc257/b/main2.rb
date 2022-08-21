N, K, Q = gets.chomp.split.map(&:to_i)

A = gets.chomp.split.map(&:to_i)
L = gets.chomp.split.map(&:to_i)
A << N + 1

L.each do |l|
  next if A[l - 1] + 1 == A[l]

  A[l - 1] += 1
end

puts A[0...-1].join(' ')
