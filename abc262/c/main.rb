N = gets.to_i

a = gets.chomp.split.map(&:to_i)

coms = 0

count = 0

N.times do |i|
  if a[i] == i + 1
    coms += 1 
  elsif a[a[i] - 1] == i + 1
    count += 1
  end
end

count = count / 2
count += coms * (coms -1) /2 

puts count

