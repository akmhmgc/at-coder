N = gets.to_i
A = gets.chomp.split.map(&:to_i)

gcd= A[0]


flag = true
A.each do |ai|
  flag = false if ai % 2 != 0 && ai % 3 != 0
end


1.upto(N-1) do |i|
  gcd = gcd.gcd(A[i])
end

a_2 = (0..30).map{|i| 2**i}
b_2 = (0..30).map{|i| 3**i}

count = 0

A.each do |ai|
  syou = ai / gcd

  a_count = 0
  b_count = 0

  30.downto(1) do |i|
    ans = syou % a_2[i]
    if ans == 0
      a_count = i 
      break 
    end
  end

  30.downto(1) do |i|
    ans = syou % b_2[i]
    if ans == 0
      b_count = i 
      break 
    end
  end

  wari = syou / a_2[a_count] / b_2[b_count]
  if wari != 1
    puts -1
    exit
  end

  count += a_count + b_count
end

puts count
