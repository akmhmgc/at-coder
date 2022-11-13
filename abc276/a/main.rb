S = gets.chomp

ans = -1
0.upto(99) do |i|
  ans = i + 1 if S[i] == 'a'
end

puts ans
