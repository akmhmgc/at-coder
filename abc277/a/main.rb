N ,X = gets.chomp.split.map(&:to_i)
P = gets.chomp.split.map(&:to_i)

ans = -1
P.each_with_index do |pi, idx|
  ans = idx + 1 if pi == X
end

puts ans
