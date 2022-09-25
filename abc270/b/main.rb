G, W ,H = gets.chomp.split.map(&:to_i)



if G.abs < W.abs or (G-W).abs == W.abs + G.abs
  puts G.abs
  exit
end


if W < 0
  G = G* (-1)
  W = W * (-1)
  H = H * (-1)
end

if W < H
  puts -1
else
  puts (G - H).abs + H.abs
end
