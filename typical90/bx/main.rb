N = gets.to_i
a = gets.chomp.split.map(&:to_i)

whole = a.sum
A = a * 2

cumsum = [0]
(2 * N).times do |i|
  cumsum << A[i] + cumsum[i]
end

flag = false

cumsum.each do |sum|
  st = sum
  val = st + whole / 10.to_f
  en = cumsum.bsearch { |x| x >= val }.to_i
  flag = true if en == val
end

puts flag ? 'Yes' : 'No'
