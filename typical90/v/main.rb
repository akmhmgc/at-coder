a,b,c = gets.chomp.split.map(&:to_i)

gcd = a.gcd(b).gcd(c)

puts [a + b + c].sum / gcd - 3
