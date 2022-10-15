N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }
M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
  G[b] << a
end

def bfs(s, c , g, color)
  queue = [s]
  color[s] = c
   
  until (v = queue.shift).nil?
    
    g[v].each do |v_next|
      return false if color[v_next] * color[v] == 1
      next if color[v_next] != 0

      # 前の頂点の情報を取ってくる
      color[v_next] = color[v] * (-1)
      
      queue << v_next
    end
  end
  # ある頂点から交互に色を塗り切れた時
  true
end

flag = true

color = Array.new(N, 0)

N.times do |i|
  next if color[i] != 0

  flag = false if bfs(i, 1, G, color) == false
end

puts flag ? 'Yes' : 'No'

