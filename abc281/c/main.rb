N, T = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

# cumsum[i]: i番目まで足した合計
cumsum = Array.new(N, 0)

cumsum[0] = A[0]

1.upto(N-1) do |i|
  cumsum[i] = cumsum[i-1] + A[i]
end

sum = cumsum.last
T %= sum

index = cumsum.bsearch_index {|x| x >=  T }
cumsum << 0

val = T - cumsum[index-1]

puts [index + 1, val] * ' '
