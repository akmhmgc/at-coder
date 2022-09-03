N, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i).sort

max = 0

M.times do |i|
  max += A[N - i - 1] * (M - i)
end

p max
