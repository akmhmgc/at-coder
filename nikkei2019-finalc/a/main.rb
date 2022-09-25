N = gets.to_i
A = gets.chomp.split.map(&:to_i)

# 前からi - j番目の合計: cumsum[j] - cumsum[i - 1](1スタート)
def cumsum(arr)
  length = arr.length
  arr.unshift(0)
  cumsum = Array.new(length + 1, 0)
  1.upto(length) { |i| cumsum[i] += cumsum[i - 1] + arr[i] }
  cumsum
end

C = cumsum(A)

1.upto(N) do |k|
  values = []

  (N - k + 1).times do |i|
    s = i
    e = i + k
    values << (C[e] - C[s])
  end

  puts values.max
end
