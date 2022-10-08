N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }
M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end


def dfs(v, c ,been, colors)
  return if been[v] == true
  
  been[v] = true
  colors[v] = c
  
  c *= -1
  
  G[v].each do |v_next|
    dfs(v_next, c ,been, colors)
  end
end

colors = Array.new(N,0)
been = Array.new(N, false)


N.times do |i|
  next if been[i] == true
  dfs(0,i,been, colors)
end


flag = true

N.times do |i|
  # iに繋がっているG[i]が全て反対であることをチェックする
  G[i].each do |gi|
    next if colors[i] * colors[gi] == -1

    flag = false
  end
end

puts flag ? 'Yes' : 'No'
