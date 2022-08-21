A, B, C, X, Y = gets.chomp.split.map(&:to_i)

min = 5000 * (10**7)

0.upto(2*10**5).each do |abi|
  amount = abi * C

  x = X - abi / 2
  y = Y - abi / 2

  amount += A * x if x > 0
  amount += B * y if y > 0

  min = [min, amount].min
end

puts min
