N,M,T =gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)
Y = Array.new(N, 0)

M.times do
  x,y = gets.chomp.split.map(&:to_i)
  Y[x - 1] = y
end

t = T

flag = true

(N - 1).times do |i|
  if t - A[i] <= 0
    flag = false
    break
  end
  t -= A[i]
  t += Y[i + 1]
end

puts flag ? 'Yes' : 'No'
