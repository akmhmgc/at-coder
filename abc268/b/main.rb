S = gets.chomp.chars
T = gets.chomp.chars

if S.length > T.length
  puts 'No'
  exit
end


flag = true
S.each_with_index do |s, idx|
  next if S[idx] == T[idx]
  
  flag = false
end 

puts flag ? 'Yes' : 'No'
