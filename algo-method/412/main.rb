N, M = gets.chomp.split.map(&:to_i)
exit if N == 0
AB = Array.new(N) { gets.chomp.split.map(&:to_i) }

follow = Array.new(N) { [] }

AB.each do |ai,bi|
  follow[ai] << bi
end

puts(follow.map{|f| f.sort.join(' ')})
