S = gets.chomp
T = gets.chomp

if S.length > T.length
  puts 'No'
  exit
end

puts T.start_with?(S) ? 'Yes' : 'No'
