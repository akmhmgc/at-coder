h1, h2, h3, w1, w2, w3 = gets.chomp.split.map(&:to_i)

def combin(n)
  arr = []
  (1..(n - 1)).to_a.combination(2).map do |a, b|
    arr << [a, b - a, n - b]
  end
  arr
end

arr1 = combin(h1)
arr2 = combin(h2)

count = 0

arr1.each do |row1|
  arr2.each do |row2|
    col_sum = [row1, row2].transpose.map(&:sum)
    row3 = [w1 - col_sum[0], w2 - col_sum[1], w3 - col_sum[2]]
    next if row3.find { |item| item <= 0 }

    count += 1 if row3.sum == h3
  end
end

puts count
