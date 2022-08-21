R, C = gets.chomp.split.map(&:to_i)
A = Array.new(R) { gets.chomp.split.map(&:to_i) }
 
def roll_over(arr)
  arr.map do |i|
    if i == 0
      1
    else
      0
    end
  end
end
 
max = 0
 
(1 << R).times do |i|
  count = 0
  ai = A.dup
  
  R.times do |ri|
    ai[ri] = roll_over(ai[ri]) if ((i >> ri) & 1) == 1
  end
 
  ai.transpose.each do |ci|
    all = ci.count
    zeros = ci.count(0)
    count += [all - zeros, zeros].max
  end
  max = [max,count].max
end
 
puts max
