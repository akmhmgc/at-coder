N = gets.to_i
S = gets.chomp
W = gets.chomp.split.map(&:to_i)

hash = {}

N.times do |i|
  s = S[i]
  w = W[i]

  hash[w] = [0,0] if hash[w].nil?
  hash[w][s.to_i] += 1 
end

cumsun = []


hash.to_a.sort.map{|item| item[1]}.each_with_index do |val, idx|
  if idx.zero?
    cumsun << val 
  else
    cumsun << [cumsun[idx - 1], val].transpose.map(&:sum)
  end
end

max = -1

cumsun.unshift([0,0])


cumsun.each do |i|
  left = i
  right = [cumsun[-1], left].transpose.map{|item| item[0] - item[1]}

  count = N - (left[1] + right[0])
  max = [max, count].max
end

puts max
