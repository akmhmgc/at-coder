A,B = gets.chomp.split.map(&:to_i)

lcm = A.lcm(B) 

puts lcm > 10**18 ? 'Large' : lcm
