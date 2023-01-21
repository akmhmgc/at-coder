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

a_ans = 10**20
A.each do |ai|
  count = 0
  A.each do |aj|
    count += (ai - aj).abs
  end
  a_ans = [count, a_ans].min
end

ans += a_ans

b_ans = 10**20
B.each do |bi|
  count = 0
  B.each do |bj|
    count += (bi - bj).abs
  end
  b_ans = [count, b_ans].min
end

ans += b_ans

puts ans
