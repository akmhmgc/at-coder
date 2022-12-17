MAX = 10**20
N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }
S = Array.new(N, MAX)
D = Hash.new(0)
M.times do
  u, v, w = gets.chomp.split.map(&:to_i)
  G[u] << v
  D[[u,v]] = w
end

que = [0]
S[0] = 0

while que.length > 0
  v = que.shift

  G[v].each do |nv|
    que << nv if S[nv] == MAX

    S[nv] = [S[nv], S[v] + D[[v,nv]]].min
  end
end

puts S.last == MAX ? -1 : S.last
