N = gets.to_i

count = 0
1.upto(N) do |num|
  next if num.even?

  yakusu = 0
  1.upto(num) do |i|
    yakusu += 1 if num % i == 0
  end
  count += 1 if yakusu == 8
end

puts count
