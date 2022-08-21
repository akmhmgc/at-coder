n = gets.to_i

c_p = Array.new(n) { gets.chomp.split.map(&:to_i) }

cumsum_1 = []
cumsum_2 = []

c_p.each_with_index do |cls_pnt, idx|
  cls, pnt = cls_pnt

  cumsum_1[idx] = cumsum_1[idx - 1].to_i
  cumsum_2[idx] = cumsum_2[idx - 1].to_i

  if cls == 1
    cumsum_1[idx] += pnt
  else
    cumsum_2[idx] += pnt
  end
end

cumsum_1.unshift(0)
cumsum_2.unshift(0)

q = gets.to_i
q.times do
  l, r = gets.chomp.split.map(&:to_i)
  ai = cumsum_1[r] - cumsum_1[l - 1]
  bi = cumsum_2[r] - cumsum_2[l - 1]
  puts [ai, bi].join(' ')
end
