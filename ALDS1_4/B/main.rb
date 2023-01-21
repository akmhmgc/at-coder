n = gets.to_i
S = gets.chomp.split.map(&:to_i).sort
q = gets.to_i
T = gets.chomp.split.map(&:to_i)

count = 0
T.each do |i|
  count += 1 if S.bsearch{|x| x >= i } == i
end

puts count
