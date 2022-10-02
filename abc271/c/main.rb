N = gets.to_i
A = gets.chomp.split.map(&:to_i).sort.unshift(0)

# i巻目の本を読んだかどうか
vol = Array.new(N + 2, false)

# 二冊以上ある、またはNを越える巻は確実に売る
sold = 0

A.each do |book|
  sold += 1 if book >= N + 1
  sold += 1 if vol[book] == true
  vol[book] = true if book <= N
end

l = 1
r = N

while true
  l += 1 while vol[l] == true
  r -= 1 while vol[r] == false && r != 0

  if sold >= 2
    sold -= 2
    vol[l] = true
  else
    break if l >= r

    vol[r] = false
    sold += 1
  end
end

puts l - 1
