n, q = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)


first = []
diff = []

q.times do |i|
  qi = gets.to_i
  if i == 1
    first = a.map{|val| val - qi}
  else
    
  end
end

p first
