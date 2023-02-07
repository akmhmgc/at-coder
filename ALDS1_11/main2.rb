N = gets.to_i
G = Array.new(N + 1) { [] }

N.times do
  u, _, *v = gets.chomp.split.map(&:to_i)
  G[u].push(*v)
end

been = Array.new(N + 1, -1)

que = [1]
been[1] = 0
while true
  v = que.shift
  break if v.nil?

  G[v].each do |nv|
    next if been[nv] != -1

    been[nv] = been[v] + 1

    que << nv
  end
end

1.upto(N) do |i|
  puts [i, been[i]].join(' ')
end
