S = gets.chomp.split('')

if S.length != 8
  puts 'No'
  exit
end

a1 = S.first
a2 = S.last

A = ('A'..'Z').to_a

if !A.include?(a1) || !A.include?(a2)
  puts 'No'
  exit
end

nums = S[1...-1]
N =  ("0"..'9').to_a

nums.each do |ni|
  next if N.include?(ni)

  puts 'No'
  exit
end

val = nums.join.to_i

if 100000 > val || val > 999999
  puts 'No'
  exit
end

puts 'Yes'
