N, M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

# 前からi - j番目の合計: cumsum[j] - cumsum[i - 1](1スタート)
def cumsum(arr)
  length = arr.length
  arr.unshift(0)
  cumsum = Array.new(length + 1, 0)
  1.upto(length) { |i| cumsum[i] += cumsum[i - 1] + arr[i] }
  cumsum
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
  val -= (cumsum[M + i - 1] - cumsum[i - 1])
  max = [max, val].max
end

puts max
