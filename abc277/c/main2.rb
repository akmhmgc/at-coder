require 'set'
n = gets.to_i
to = Hash.new { |h, k| h[k] = [] }

n.times do |_i|
  a, b = gets.split.map(&:to_i)
  to[a] << b
  to[b] << a
end

queue = [s]
until (v = queue.shift).nil?
  been[v] = true
  g[v].each do |v_next|
    next if been[v_next] == true

    prev[v_next] = v
    queue << v_next
  end
end

reach = [1].to_set
queue = [1]
until queue.empty?
  v = queue.shift
  to[v].each do |v_next|
    queue << v_next if reach.add?(v_next)
  end
end
