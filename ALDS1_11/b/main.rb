N = gets.to_i

G = Array.new(N + 1) { [] }

N.times do
  u, k, *v = gets.chomp.split.map(&:to_i)

  k.times do |i|
    G[u] << v[i]
  end
end


@been = Array.new(N + 1, false)
@hakken = Array.new(N + 1, 0)
@kanryou = Array.new(N + 1, 0)
@time = 0

def dfs(v)
  return if @been[v] == true

  @time += 1
  @been[v] = true
  @hakken[v] = @time

  G[v].sort.each do |v_next|
    dfs(v_next)
  end

  @time += 1
  @kanryou[v] = @time
end

# 有向グラフを見てなければスタート地点を変える場合
1.upto(N) do |i|
  dfs(i)
end

1.upto(N) do |i|
  puts [i, @hakken[i], @kanryou[i]].join(' ')
end
