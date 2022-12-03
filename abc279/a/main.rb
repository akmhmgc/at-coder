chars = gets.chomp.chars

count = 0


chars.each do |c|
  if c == 'v'
    count+= 1
  else
    count += 2
  end
end

puts count
