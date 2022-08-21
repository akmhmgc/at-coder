n = gets.to_i

map = {}

n.times do
  s = gets.chomp
  map[s] = map[s].to_i + 1
end

max = map.values.max
puts map.select { |_k, v| v == max }.keys.sort
