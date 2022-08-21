N, Q = gets.chomp.split.map(&:to_i)

@points = Array.new(N, -1)
# @points = [-1, 4, 4, 2, 4, -1, -1, -1]

def root(idx)
  up = @points[idx]
  return idx if up < 0

  @points[idx] = root(up)
  root(up)
end

def join(a, b)
  return if root(a) == root(b)

  @points[root(a)] = root(b)
end

Q.times do
  pi, ai, bi = gets.chomp.split.map(&:to_i)

  if pi == 1
    puts root(ai) == root(bi) ? 'Yes' : 'No'
  else
    join(ai, bi)
  end
end

