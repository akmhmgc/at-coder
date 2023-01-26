N,X = gets.chomp.split.map(&:to_i)
A = []
B = []
N.times do 
  a,b = gets.chomp.split.map(&:to_i)
  A << a
  B << b
end

can_pay = 1

N.times do |i|
  ai = A[i]
  B[i].times do
    can_pay |= can_pay << ai
  end
end

puts (can_pay >> X) & 1 == 1 ? 'Yes' : 'No'
