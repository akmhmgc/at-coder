H, W = gets.chomp.split.map(&:to_i)
pasts = Array.new(H) { Array.new(W, false) }
G = Array.new(H) { gets.to_s.chars }

now = [0, 0]
pasts[0][0] = true

300000.times do
  r, w = now
  mark = G[r][w]
  new_r, new_w = if mark == 'U'
                    [r - 1, w]
                 elsif mark == 'D'
                    [r + 1, w]
                 elsif mark == 'L'
                    [r, w - 1]
                 else
                    [r, w + 1]
                 end
  if new_r < 0 || new_r > H - 1 || new_w < 0 || new_w > W - 1
    puts now.map{|i| i+=1 }.join(' ')
    exit
  end
  now = new_r, new_w
end

puts '-1'
