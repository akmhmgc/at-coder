N, Q, x = gets.chomp.split.map(&:to_i)
W = gets.chomp.split.map(&:to_i)
K = Array.new(Q){gets.to_i}

# 合計
goukei = W.sum
amari = x % goukei
sho = x / goukei

cumsum = [0]

W.each_with_index do |wi, idx|
  cumsum[idx] = cumsum[idx - 1] + wi
end

cumsum = cumsum

# 組み合わせを保存
com = []

idx = 0
mae = 0

while true do
  val = if idx.zero?
    amari
  else
    amari + cumsum[idx - 1]
  end

  id = cumsum.bsearch_index { |x| x >= val }

  unless id
    val -= cumsum[-1]
    id = cumsum.bsearch_index { |x| x >= val }
  end

  break if com.include?([idx, id])
  
  if i = com.find_index([idx, id])
    mae = i
    break
  end

  com << [idx, id]
  idx = id + 1
end


com.map! do |i|
  if i[0] <= i[1]
    i[1] - i[0] + 1
  else
    (N - i[0]) + i[1] + 1
  end
end


K.each do |ki|
  if mae >= (ki - 1)
    puts com[ki - 1]
  else
    idx = (ki - 1 - mae) % (com.length - (mae + 1))
    puts com[(mae + 1)..-1][idx - 1]
  end
end
