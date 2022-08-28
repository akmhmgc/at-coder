N = gets.to_i

if N == 1
  puts 3.5
  exit
end

a = 0

(N-1).times do |i|
  a+= 1/(2**i).to_i
end

puts (15/6)
