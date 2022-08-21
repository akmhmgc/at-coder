n, w = gets.chomp.split.map(&:to_i)

a = Array.new(10**6, 0)

n.times do
  s, t, p = gets.split.map(&:to_i)
  a[s] += p
  a[t] -= p
end

sum = 0

a.each do |item|
  sum += item
  if sum > w
    puts 'No'
    exit
  end
end

puts 'Yes'
