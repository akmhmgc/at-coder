Q = gets.to_i

cards = []
Q.times do
  t,x = gets.chomp.split.map(&:to_i)
  cards.unshift(x) if t == 1
  cards << x if t == 2
  puts cards[x - 1] if t == 3
end
