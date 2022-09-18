N = gets.to_i

puts(60.times.inject([0]) do |ans, i|
  ans += ans.map { |a| a + (1 << i) } if (N >> i) & 1 == 1
  ans
end)
