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
  puts(
    0.upto(N - k).reduce(0) do |ans, i|
      [ans, C[i + k] - C[i]].max
    end
  )
end
