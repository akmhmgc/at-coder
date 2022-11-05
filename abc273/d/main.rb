H, W, rs, cs = gets.chomp.split.map(&:to_i)

N = gets.to_i

@kabe_r = Array.new(H + 1) { [0, W + 1] }
@kabe_c = Array.new(W + 1) { [0, H + 1] }

N.times do
  r, c = gets.chomp.split.map(&:to_i)
  @kabe_r[r] << c
  @kabe_c[c] << r
end

Q = gets.to_i
query = []
Q.times do
  d, l = gets.chomp.split(' ')
  l = l.to_i
  query << [d, l]
end

@kabe_r.map(&:sort!)
@kabe_c.map(&:sort!)

def move(rs, cs, query)
  d, l = query
  case d
  when 'L'
    max_move = cs - @kabe_r[rs].reverse.bsearch { |v| v < cs } - 1
    cs -= [max_move, l].min
  when 'R'
    max_move = @kabe_r[rs].bsearch { |v| v > cs } - cs - 1
    cs += [max_move, l].min
  when 'U'
    max_move = rs - @kabe_c[cs].reverse.bsearch { |v| v < rs } - 1
    rs -= [max_move, l].min
  when 'D'
    max_move = @kabe_c[cs].bsearch { |v| v > rs } - rs - 1
    rs += [max_move, l].min
  end
  [rs, cs]
end

query.each do |q|
  rs, cs = move(rs, cs, q)
  puts [rs, cs].join(' ')
end
