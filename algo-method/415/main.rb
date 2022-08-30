N, X = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i).unshift(-1)

res = 0
x = X
while x !=0
  x = A[x]
  res+= 1
end

puts res
