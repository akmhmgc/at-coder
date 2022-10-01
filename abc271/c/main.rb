N = gets.to_i
A = gets.chomp.split.map(&:to_i).sort

if N == 1
  if A[0] == 1
    puts 1
  else
    puts 0
  end
  exit
end

i = 0
count = 0
diff = 0
len = N - 1

while true do
  break if i == len + 1

  if A[i] == i + 1 + diff
    count += 1
    i += 1
  elsif len - i == 1
    i += 1
    count += 1
    break
  elsif len - i > 1
    len -= 2
    diff += 1
    count +=1
    A.pop(2)
  end
end

puts count
