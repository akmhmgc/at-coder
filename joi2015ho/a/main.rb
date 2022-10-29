N, M = gets.chomp.split.map(&:to_i)
P = gets.chomp.split.map(&:to_i)

A = [0]
B = [0]
C = [0]

(N - 1).times do
  a, b, c = gets.chomp.split.map(&:to_i)
  A << a
  B << b
  C << c
end

T = Array.new(N + 1, 0)

0.upto(M - 2) do |i|
  s = P[i]
  e = P[i + 1]
  s, e = e, s if s > e

  T[s] += 1
  T[e] -= 1
end

N.times do |i|
  T[i + 1] += T[i]
end

ans = 0

1.upto(N - 1) do |i|
  count = T[i]
  ans += [
    A[i] * count,
    B[i] * count + C[i]
  ].min
end

puts ans
