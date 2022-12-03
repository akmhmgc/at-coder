H, W = gets.chomp.split.map(&:to_i)

S = Array.new(H) { gets.chomp.split('') }
T = Array.new(H) { gets.chomp.split('') }

puts S.transpose.sort == T.transpose.sort ? 'Yes' : 'No'
