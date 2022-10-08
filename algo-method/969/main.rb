N, M, S, T = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

been = Array.new(N, false)

@went = []
def rec(v, t, been)
  return if been[v] == true

  been[v] = true
  @went << v
  if v == t
    puts @went.count
    puts @went * ' '
  end

  G[v].each do |v_next|
    rec(v_next, t, been)
  end

  @went.pop(1)
end

rec(S, T, been)
