N, M = gets.chomp.split.map(&:to_i)

AB = Array.new(M) { gets.chomp.split.map(&:to_i) }

K = gets.to_i
condition = Array.new(K) { gets.chomp.split.map(&:to_i) }

max = 0

# (2**K).times do |i|
#   score = 0
#   arr = Array.new(N + 1, false)

#   i.to_s(2).rjust(K, '0').split('').map(&:to_i).each_with_index do |j, idx|
#     arr[condition[idx][j]] = true
#   end

#   AB.each do |a, b|
#     score += 1 if arr[a] == true && arr[b] == true
#   end
#   max = [max, score].max
# end

# puts max


