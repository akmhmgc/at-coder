N = gets.to_i
G = []

N.times do
  i, k, *v = gets.chomp.split.map(&:to_i)
  G << v.map { |j| j - 1 }
end

def dfs(v, d, f)
  return if d[v] != -1

  @t += 1
  d[v] = @t
  G[v].each do |nv|
    dfs(nv, d, f)
  end
  @t += 1
  f[v] = @t
end

d = Array.new(N, -1)
f = Array.new(N, -1)
@t = 0

N.times do |i|
  dfs(i, d, f)
end

N.times do |i|
  puts "#{i + 1} #{d[i]} #{f[i]}"
end
