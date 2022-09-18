N,M = gets.chomp.split.map(&:to_i)
G = Array.new(N){[]}

M.times do 
  a,b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

# 連結かどうかは適当な頂点を始点として全ての点を探索できるかどうかで調べることができる
@been = Array.new(N,false)

def rec(v)
  @been[v] = true

  G[v].each do |v_next| # n_vの方が変換でミスらないかも
    next if @been[v_next] ==true

    rec(v_next)
  end
end

rec(0)

puts @been.include?(false) ? 'No' : 'Yes'
