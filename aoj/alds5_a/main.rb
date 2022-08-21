n = gets.to_i
a = gets.chomp.split.map(&:to_i)
q = gets.to_i
m = gets.chomp.split.map(&:to_i)

sums = []

(1 << n).times do |i|
  p i.to_s(2)
end

m.each do |i|
  puts sums.include?(i) ? 'yes' : 'no'
end

(2**K).times do |i|
  i.to_s(2).rjust(K, '0').split('').map(&:to_i)
end
