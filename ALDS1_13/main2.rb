def not_attack(v1, v2)
  x1, y1 = v1
  x2, y2 = v2

  dx = (x1 - x2).abs
  dy = (y1 - y2).abs

  return false if dx == dy

  true
end

K = gets.to_i
P = Array.new(K) { gets.chomp.split.map(&:to_i) }

X = (0...8).to_a
Y = (0...8).to_a.permutation(8)

Y.each do |yi|
  flag = true

  P.each do |i, j|
    flag = false if yi[i] != j
  end
  next if flag == false

  (0...8).to_a.permutation(2) do |i, j|
    v1 = [X[i], yi[i]]
    v2 = [X[j], yi[j]]
    flag = false if not_attack(v1, v2) == false
  end

  next unless flag

  dots = Array.new(8) { Array.new(8, false) }
  8.times do |i|
    dots[i][yi[i]] = true
  end
  dots.each do |line|
    puts line.map{|v| v == true ? 'Q' : '.'} * ''
  end
  break
end
