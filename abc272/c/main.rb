N = gets.to_i
A = gets.chomp.split.map(&:to_i)

if N == 2
  if A.sum.odd?
    puts -1
    exit
  end
end

ODD = []
EVEN = []

A.sort.each do |a|
  ODD << a if a.odd?
  EVEN << a if a.even?
end


odd_max = ODD.length >=2 ? ODD[-2..-1].sum : 0
even_max = EVEN.length >=2 ? EVEN[-2..-1].sum : 0

puts [odd_max , even_max].max
