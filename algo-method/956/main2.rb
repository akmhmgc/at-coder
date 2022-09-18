N,M = gets.chomp.split.map(&:to_i)
G = Array.new(N){[]}

M.times do 
  a,b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

@been = Array.new(N,false)

def rec(v)
  @been[v] = true

  G[v].each do |v_next| # n_vの方が変換でミスらないかも
    next if @been[v_next] ==true

    rec(v_next)
  end
end

# 難しくwhileで考える必要はない（最大でもN回しか計算しないので）
ans = 0
N.times do |v|
  next if @been[v] == true

  rec(v)
  ans += 1
end

puts ans

