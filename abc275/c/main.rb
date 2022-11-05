G = []

dots = Array.new(9){Array.new(9,false)}

9.times do |i|
  s = gets.chomp.split('')
  s.each_with_index do |v, idx|
    if v == '#'
      G << [i,idx] 
      dots[i][idx] = true
    end
  end
end

# 内角
def naiseki(v1,v2)
  x1,y1 = v1
  x2,y2 = v2
  x1 * x2 + y1 * y2
end

# p1を直角と仮定した時の合格
def ok(p1,p2,p3)
  v1 = [p2,p1].transpose.map{|a| a[0] - a[1]}
  v2 = [p3,p1].transpose.map{|a| a[0] - a[1]}

  return false if naiseki(v1, v2) != 0

  x1, y1 = v1
  x2, y2 = v2
  
  return false if x1**2 + y1**2 != x2**2 + y2**2
  true
end


count = 0
G.permutation(3) do |points|
  p1,p2,p3 = points

  if ok(p1,p2,p3)
    v1 = [p2,p1].transpose.map{|a| a[0] - a[1]}
    v2 = [p3,p1].transpose.map{|a| a[0] - a[1]}
    x ,y = [p1,v1,v2].transpose.map{|arr| arr.inject(:+)}

    next unless (x >= 0 && x <= 8 && y >= 0 && y <= 8)

    count += 1 if dots[x][y] == true
  end
end

puts count / 8

