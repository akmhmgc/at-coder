N = gets.to_i

sum = []

60.times do |i|
  if i == 0
    sum = if N & 1 == 1
               [0, 1]
             else
               [0]
             end
    next
  end

  if N >> i & 1 == 1
    sum += sum.map { |val| val + 2**i }
  end
end

sum.each do |i|
  puts i
end
