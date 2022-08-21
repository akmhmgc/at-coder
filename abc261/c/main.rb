N = gets.to_i
hash = {}

N.times do
  s = gets.chomp
  hash[s] = hash[s].to_i + 1

  if hash[s] == 1
    puts s 
  else
    puts "#{s}(#{hash[s] - 1})"
  end
end
