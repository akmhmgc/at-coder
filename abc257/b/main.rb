N, K, Q = gets.chomp.split.map(&:to_i)

A = gets.chomp.split.map(&:to_i)
L = gets.chomp.split.map(&:to_i)

arr = Array.new(N, 0)

A.each do |a|
  arr[a - 1] = 1
end

def idx(num, arr)
  point = 0
  arr.each_with_index do |item, idx|
    next if item.zero?

    point += 1
    return idx if point == num
  end
end

L.each do |l|
  index = idx(l, arr)
  next if index == N - 1
  next if arr[index + 1] == 1

  
  arr[index] = 0
  arr[index + 1] = 1
end

msg = []

arr.each_with_index do |i, ix|
  msg << ix + 1 if i == 1
end

puts msg.join(" ")
