N  = gets.to_i

puts N.to_s(16).split('').map(&:upcase).join('').rjust(2, "0")  
