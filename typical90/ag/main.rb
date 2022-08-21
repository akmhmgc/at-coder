H,W = gets.chomp.split.map(&:to_i)

puts ( H == 1 || W ==1 )? H * W : ((H + 1)/2) * ((W + 1)/2)
