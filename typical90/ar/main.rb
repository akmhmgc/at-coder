N, Q = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

shift = 0
Q.times do
  t, x, y = gets.chomp.split.map(&:to_i)
  if t == 1
    x = (x - shift) % N
    y = (y - shift) % N
    A[x - 1], A[y - 1] = A[y - 1], A[x - 1]
  end

  puts A[(x - shift) % N - 1] if t == 3
  shift += 1 if t == 2
end
