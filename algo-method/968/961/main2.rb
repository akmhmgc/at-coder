N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }
M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end


def dfs(v, c, colors)
  colors[v] = c

  c *= -1

  G[v].each do |v_next|
    return false if colors[v_next] * colors[v] == 1
    next if colors[v_next] != 0
  
    dfs(v_next, c, colors)
  end

  true
end

colors = Array.new(N, 0)

flag = true

N.times do |i|
  next if been[i] == true

  flag = false if dfs(0, i, been, colors) == false
end


puts flag ? 'Yes' : 'No'
