def distance
  x, a, d, n = gets.chomp.split.map(&:to_i)

  st = a
  en = a + d * (n - 1)

  st, en = en, st if d.negative?
  d = d.abs
  return st - x if x <= st
  return x - en if en <= x

  st -= a
  x -= a

  mod = x % d
  [mod, d - mod].min
end

puts distance
