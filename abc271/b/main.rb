N,Q = gets.chomp.split.map(&:to_i)
A = []

N.times do 
  line = gets.chomp.split.map(&:to_i)
  A << line[1..-1]
end

Q.times do 
  s, t = gets.chomp.split.map(&:to_i)
  puts A[s-1][t-1]
end
