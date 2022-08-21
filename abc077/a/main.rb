N = gets.to_i
A = gets.chomp.split.map(&:to_i).sort
B = gets.chomp.split.map(&:to_i).sort
C = gets.chomp.split.map(&:to_i).sort

sum = 0
B.each do |bi|
  id_a = A.bsearch_index { |v| v >= bi } || N
  id_c = N - ( C.bsearch_index { |v| v > bi } || N )
  sum += id_a * id_c
end

puts sum
