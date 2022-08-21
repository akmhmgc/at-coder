N = gets.to_i
S = gets.chomp.split('')
W = gets.chomp.split.map(&:to_i)

kids = []
adults = []

S.zip(W).each do |n, w|
  n = n.to_i
  kids << w if n.zero?
  adults << w if n == 1
end

all = (kids + adults).sort << 10**10
kids.sort!
adults.sort!

kids << 10**11
adults << 10**11

count = 0

all.each do |i|
  kits_count = kids.bsearch_index { |x| x >= i }
  adults_count = adults.count - adults.bsearch_index { |x| x >= i } - 1
  count = [count, kits_count + adults_count].max
end

puts count
