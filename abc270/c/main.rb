N,X,Y = gets.chomp.split.map(&:to_i)

G = Array.new(N + 1){[]}

(N-1).times do
  u,v = gets.chomp.split.map(&:to_i)
  G[u] << v
  G[v] << u
end


def dfs(v, g,been, went)
  return if been[v] == true
  been[v] = true
  went << v

  G[v].each do |v_next|
    dfs(v_next, g,been, went)
  end

  if v == g
    puts went * ' '
  else
    went.pop
  end
end

been = Array.new(N + 1, false)

dfs(X, Y,been, [])

