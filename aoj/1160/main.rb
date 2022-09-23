def dfs(i, j, h, w, graph)
  return if i < 0 || j < 0 || i >= h || j >= w || graph[i][j] == true

  graph[i][j] = true

  [-1, 0, 1].repeated_permutation(2).each do |d_i, d_j|
    i_next = i + d_i
    j_next = j + d_j
    dfs(i_next, j_next, h, w, graph)
  end
end

while (w, h = gets.chomp.split.map(&:to_i)) != [0, 0]
  graph = []
  h.times do
    line = gets.chomp.split.map(&:to_i).map { |v| v == 0 }
    graph << line
  end

  count = 0
  h.times do |i|
    w.times do |j|
      next if graph[i][j] == true

      count += 1
      dfs(i, j, h, w, graph)
    end
  end
  puts count
end
