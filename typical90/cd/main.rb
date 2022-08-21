L, R = gets.chomp.split.map(&:to_i)

def count(num)
  len = num.to_s.size
  count = 0
  (len - 1).times do |i|
    st = 10.pow(i)
    en = 10.pow(i + 1) - 1
    count += (i + 1) * (st + en) * (en - st + 1) / 2
  end

  st = 10.pow(len - 1)
  en = num
  count += len * (st + en) * (en - st + 1) / 2
  count
end

puts (count(R) - count(L - 1)) % (10.pow(9) + 7)
