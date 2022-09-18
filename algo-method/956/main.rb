N,M = gets.chomp.split.map(&:to_i)
G = Array.new(N){[]}

M.times do 
  a,b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

@been = Array.new(N,false)
@nodes = 0


def rec(v)
  @been[v] = true

  G[v].each do |v_next| # n_vの方が変換でミスらないかも
    next if @been[v_next] ==true

    rec(v_next)
  end
end

while !(v = @been.find_index(false)).nil
  @nodes += 1
  rec(v)
end

puts @nodes

