N = gets.to_i
G = Array.new(N){[]}

(N-1).times do 
  a,b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end


que = [0]
been = Array.new(N, false)
count = Array.new(N, 0)

while true
  break if (v = que.shift).nil?
  been[v] = true

  G[v].each do |v2|
    next if been[v2] == true
    count[v2] = count[v] + 1
    que << v2
  end
end

puts count.max
