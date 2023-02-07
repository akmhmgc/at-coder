VECS = []
[-1, 0, 1].each do |i|
  [-1, 0, 1].each do |j|
    VECS << [i, j] unless i == 0 && j == 0
  end
end

def dfs(i, j, been)
  return if been[i][j] == true

  been[i][j] = true

  VECS.each do |di, dj|
    ni = i + di
    nj = j + dj

    next if ni < 0 || nj < 0 || ni >= been.length || nj >= been.first.length || been[ni][nj] == true

    dfs(ni, nj, been)
  end
end

def land_count(graph)
  count = 0
  been = []
  graph.each do |line|
    been << line.map { |d| !(d == 1) }
  end
  h = graph.length
  w = graph.first.length
  h.times do |i|
    w.times do |j|
      next if been[i][j] == true

      count += 1
      dfs(i, j, been)
    end
  end
  count
end

while true
  w, h = gets.chomp.split.map(&:to_i)
  break if w == 0

  graph = Array.new(h) { gets.chomp.split.map(&:to_i) }
  puts land_count(graph)
end
