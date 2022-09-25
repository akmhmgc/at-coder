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
  value = 0

  # こっちの書き方のほうがわかりやすい
  0.upto(N - k) do |i|
    s = i
    e = i + k
    value = [value, C[e] - C[s]].max
  end

  puts value
end
