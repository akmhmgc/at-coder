n, k = gets.chomp.split.map(&:to_i)

a = gets.chomp.split.map(&:to_i)
sorted_a = a.sort

groups = Array.new(k) { [] }

n.times do |i|
  groups[i % k] << a[i]
end

groups.map(&:sort!)

b = []

n.times do |i|
  b << groups[i % k][i / k]
end

puts b == sorted_a ? 'Yes' : 'No'
