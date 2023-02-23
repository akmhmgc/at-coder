P = gets.to_f

INF = 10 ** 20
left = INF * -1
right = INF

def f(x)
  x + P / 2**(x / 1.5)
end

200.times do
  line1 = left + (right - left) / 3.to_f
  line2 = right - (right - left) / 3.to_f

  y1 = f(left)
  y2 = f(line1)
  y3 = f(line2)
  y4 = f(right)

  if y2 < y3 && y3 < y4
    right = line2
  elsif y1 > y2 && y2 > y3
    left = line1
  else
    left = line1
    right = line2
  end
end
puts left < 0 ? f(0) : f(left)
