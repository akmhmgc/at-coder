X, Y, N = gets.chomp.split.map(&:to_i)

if N < 3
  puts N * X
elsif X * 3 >= Y
  puts (N / 3) * Y + (N % 3) * X
else
  puts N * X
end
