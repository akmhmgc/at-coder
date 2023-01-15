N = gets.to_i


ans = 0
1.upto(N) do |n|
  yakusu_c = 0
  1.upto(n) do |i|
    # nの約数がちょうど8個あるかどうか
    next if n.even?

    yakusu_c+= 1 if n % i == 0
  end
  ans += 1 if yakusu_c == 8
end

puts ans
