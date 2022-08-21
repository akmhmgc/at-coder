L1, R1, L2,R2 = gets.chomp.split.map(&:to_i)

if R2 < R1
  L1, L2 = L2 ,L1
  R1, R2 = R2 ,R1
end

if R1 <= L2
  puts 0
  exit
end

puts (R1 - [L2, L1].max)
