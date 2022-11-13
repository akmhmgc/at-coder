N = gets.to_i
S = Array.new(N){ gets.chomp }

def ok(s)
  strs = s.chars
  return false unless %w[H D C S].include?(strs[0])
  return false unless %w[A 2 3 4 5 6 7 8 9 T J Q K].include?(strs[1])
  return true
end

flag = true
S.each do |str|
  flag = false unless ok(str)
end

flag = false if S.uniq.count != N

puts flag ? 'Yes' : 'No'
