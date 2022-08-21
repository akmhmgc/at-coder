N, M, X, T, D = gets.chomp.split.map(&:to_i)

if M >= X
  puts T
else
  puts T - (X - M) * D
end
