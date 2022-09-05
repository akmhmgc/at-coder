S = gets.chomp

if S == S.upcase || S == S.downcase
  puts 'No'
else
  chars = S.chars
  if chars.size == chars.uniq.size
    puts 'Yes'
  else
    puts 'No'
  end
end
