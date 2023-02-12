require 'set'
N ,M = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

P = [[1]]
2.upto(N) do |i|
  if A.include?(i - 1)
    P.last << i
  else
    P << [i]
  end
end

ans = []
P.sort_by{ |arr| arr.min }.each do |arr|
  ans.push(*arr.sort.reverse)
end

puts ans * ' '
