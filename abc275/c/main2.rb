@count = 0
G = []

9.times do |i|
  s = gets.chomp.split('')
  s.each_with_index do |v, idx|
    if v == '#'
      G << [i, idx]
    end
  end
end

def ok(p1, p2, p3, p4)
  v = []
  [p1, p2, p3, p4].combination(2).each do |p1, p2|
    @count += 1
    v << [p1,p2].transpose.map{|a,b| a - b}.reduce(0){|r,i| r + i**2}
  end
  v1,v2,v3,v4,v5,v6 = v.sort

  return false unless v1 == v2 && v2 == v3 && v3 == v4
  return false unless v5 == v6
  return false unless v1 + v2 == v5

  true
end


count = 0
G.combination(4) do |points|
  count += 1 if ok(*points)
end

puts @count
