H,W = gets.chomp.split.map(&:to_i)

count = 0
H.times do
  line = gets.chomp.split('')
  line.each do |i|

    count += 1 if i == '#'
  end
end

puts count
