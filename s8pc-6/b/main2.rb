N = gets.to_i
A = []
B = []

ans = 0
N.times do
  a, b = gets.chomp.split.map(&:to_i)
  A << a
  B << b
  ans += (a - b).abs
end

# それぞれの中央値を考える
x = A.sort[N / 2]
y = B.sort[N / 2]

A.each do |ai|
  ans += (ai - x).abs
end

B.each do |bi|
  ans += (bi - y).abs
end

puts ans
