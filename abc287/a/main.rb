N = gets.to_i
count = 0

N.times do 
  count += 1 if gets.chomp == 'For'
end 

puts count * 2 >= N ? 'Yes' : "No"
