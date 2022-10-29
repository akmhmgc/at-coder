L = 10**6
N = gets.to_i
T = Array.new(L + 2 ,0)

N.times do 
  a,b = gets.chomp.split.map(&:to_i)
  T[a] += 1
  T[b + 1] -= 1
end

1.upto(L) do |i|
  T[i] += T[i - 1]
end

puts T.max
