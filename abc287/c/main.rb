N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  v, w = gets.chomp.split.map(&:to_i)
  v -= 1
  w -= 1
  G[v] << w
  G[w] << v
end

# 条件
all = G.count
start = -1
one = 0
two = 0

N.times do |i|
  gi = G[i]
  if gi.count == 1
    one += 1
    start = i
  end
  two += 1 if gi.count == 2
end

if (one + two != all) || one != 2
  puts 'No'
  exit
end

def dfs(v,seen)
  seen[v] = true
  
  G[v].each do |nv|
    next if seen[nv] == true

    dfs(nv, seen)
  end
end

seen = Array.new(N, false)

dfs(start, seen)

puts seen.uniq == [true] ? 'Yes' : "No"

