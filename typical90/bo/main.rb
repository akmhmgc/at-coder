N, K = gets.chomp.split

n = N

K.to_i.times do
  n = n.to_i(8).to_s(9).tr('8', '5')
end

puts n
