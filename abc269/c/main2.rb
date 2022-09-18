N = gets.to_i

ans = [0]

60.times do |i|
  ans += ans.map { |a| a + 2**i } if (N >> i) & 1 == 1
end

puts ans
