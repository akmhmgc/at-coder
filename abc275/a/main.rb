N = gets.to_i
H = gets.chomp.split.map(&:to_i)
max = H.max

ans = 0
N.times do |i|
  ans = i + 1 if H[i] == max
end

puts ans
