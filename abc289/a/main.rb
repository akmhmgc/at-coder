S = gets.chomp.chars

ans = []

S.each do |i|
  ans << '0' if i == '1'
  ans << '1' if i == '0'
end

puts ans * ''
