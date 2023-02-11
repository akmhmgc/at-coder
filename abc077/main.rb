N = gets.to_i
A = gets.chomp.split.map(&:to_i).sort
B = gets.chomp.split.map(&:to_i).sort
C = gets.chomp.split.map(&:to_i).sort

count = 0
B.each do |bi|
  ai = A.bsearch_index { |v| v >= bi } || A.length
  ci = C.bsearch_index{ |v| v > bi } ? C.length - C.bsearch_index{ |v| v > bi } : 0
  count +=  ai * ci
end

puts count
