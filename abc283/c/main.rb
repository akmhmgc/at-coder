S = gets.to_i

chrs = S.to_s

chrs = chrs.split('')

len = chrs.length
zero_count = 0
chrs.each do |c|
  if c == '0'
    zero_count += 1
  else
    if zero_count > 0
      len -= zero_count / 2
      zero_count = 0
    end
  end
end

len -= zero_count / 2

puts len
