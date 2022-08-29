N, A, B = gets.chomp.split.map(&:to_i)

S = Array.new(N) { gets.chomp.split('') }
puts S[A][B]=='o' ? 'Yes' : 'No'
