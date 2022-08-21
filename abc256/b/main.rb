n = gets.to_i

a = gets.chomp.split.map(&:to_i)

arr = Array.new(4, 0)

a.each do |ai|
  arr[0] = 1
  list = Array.new(ai,0)
  arr = arr.unshift(*list)
end

puts arr[4..].count(1)
