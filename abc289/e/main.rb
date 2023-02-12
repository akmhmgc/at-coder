require 'set'

def calc(graph, colors)
  set = Set.new
  ans = 10 ** 20
  len = colors.length
  counts = Array.new(len, 0)
  s1 = 0
  s2 = len - 1

  que1 = [s1]
  que2 = [s2]

  while true
    v1 = que1.shift
    v2 = que2.shift

    break if v1 == nil || v2 == nil

    graph[v1].each do |nv1|
      graph[v2].each do |nv2|
        c1 = colors[nv1]
        c2 = colors[nv2]
        
        next if c1 == c2

        counts[nv1] = counts[v1] + 1

        p counts
        if nv1 == s2 && nv2 == s1
          # p counts[nv1]
          ans = [ans, counts[nv1]].min
        end

        next if set.include?([nv1, nv2])
        
        que1 << nv1
        que2 << nv2
        set << [nv1, nv2]
      end
    end
  end
  return ans
end


T = gets.to_i
T.times do |i|
  n, m = gets.chomp.split.map(&:to_i)
  
  # 頂点の色
  colors = gets.chomp.split.map(&:to_i)

  graph = Array.new(n){[]}

  m.times do
    a,b = gets.chomp.split.map(&:to_i).map{|v| v - 1}
    graph[a] << b
    graph[b] << a
  end

  next if i < 2

  calc(graph, colors)
end
