n = gets.to_i

map = {}

n.times do |i|
  s = gets.chomp
  next if map[s]

  map[s] = true
  puts i + 1
end

hash = { name: 'tarou', age: 45 }
