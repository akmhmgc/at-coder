N, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i).unshift(0)

cumsum = Array.new(N + 1, 0)
1.upto(N) do |i|
  cumsum[i] = cumsum[i - 1] + A[i]
end

# 最初のやつを計算する
max = 0
1.upto(M) do |i|
  max += A[i] * i
end

if M == N
  puts max
  exit
end

val = max

1.upto(N - M) do |i|
  val += M * A[i + M]
  val -= (cumsum[M + i - 1] - cumsum[i-1])
  max = [max, val].max
end

puts max

