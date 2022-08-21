a, b, d = gets.chomp.split.map(&:to_i)

th = (d / 180.to_f) * Math::PI

cos = Math.cos(th)
sin = Math.sin(th)

aa = a * cos - b * sin
bb = b * cos + a * sin

puts [aa, bb].join(' ')
