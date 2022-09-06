A, B, K = gets.chomp.split.map(&:to_i)

flag = false
count = 0

while flag != true
  if (A * K ** count) >=B
    flag = true 
    break
  end

  count+=1
end

puts count
