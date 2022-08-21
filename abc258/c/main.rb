N,Q = gets.chomp.split.map(&:to_i)
S = gets.chomp

rotate = 0

Q.times do
  t,x = gets.chomp.split.map(&:to_i)
  rotate += x if t == 1

  puts S[(x - 1 - rotate) % N] if t == 2
end
