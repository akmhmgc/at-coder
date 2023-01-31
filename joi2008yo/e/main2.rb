R,C = gets.chomp.split.map(&:to_i)

A =  []
R.times do 
  A << gets.chomp.split.map(&:to_i)
end

ans = 0
(1 << R).times do |i|
  count = 0
  B = []
  R.times do |j|
    if (i >> j) & 1 == 1
      B << A[j].map{|i| 1 - i}
    else
      B << A[j]
    end
  end
  B.transpose.each do |bi|
    v1 = 0
    v2 = 0
    bi.each do |i|
      v1 += 1 if i == 0
      v2 += 1 if i == 1
    end
    count += [v1, v2].max
  end
  ans = [ans, count].max
end

puts ans
