N = gets.to_i
A = gets.chomp.split.map(&:to_i)
Q = gets.to_i

Q.times do
  n, k, x = gets.chomp.split.map(&:to_i)
  if n == 2
    puts A[k - 1]
  else
    A[k - 1] = x
  end
end
