N, M = gets.chomp.split.map(&:to_i)
 
G = Array.new(N) { Array.new(N, -1) }
G[0][0] = 0
 
VECS = []
 
(-400).upto(400) do |x|
  (-400).upto(400) do |y|
    VECS << [x,y] if x*x + y*y == M
  end
end
 
queue = [[0, 0]]
been = Array.new(N) { Array.new(N, false) }
been[0][0] = true
 
while (v = queue.shift) != nil
  p queue
  
  x, y = v
  been[x][y] = true
 
  VECS.each do |d_x, d_y|
    x_next = x + d_x
    y_next = y + d_y
    
    next if x_next < 0 || y_next < 0 || x_next >= N || y_next >= N
    next if been[x_next][y_next] == true

    # been[x_next][y_next] = true
    G[x_next][y_next] = G[x][y] + 1
 
    queue << [x_next, y_next]
  end
end
 
G.each do |line|
  puts line * ' '
end
