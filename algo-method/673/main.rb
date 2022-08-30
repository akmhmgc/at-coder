N, M = gets.chomp.split.map(&:to_i)
exit if M == 0

follows = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  follows[a] << b
  follows[b] << a
end

puts(follows.sort_by { |arr| -arr.count }.first.sort.join(' '))
