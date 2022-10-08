N = gets.to_i
A = gets.chomp.split.map(&:to_i).sort.unshift(0)

# i巻目の本を読んだかどうか
a = Array.new(N + 2, false)


A.each do |book|
  a[book] = true if book <= N
end

read = 0

while N >= 0
  read += 1
  if a[read] == true
    N -= 1
  else
    N -= 2
  end
end

puts read - 1
