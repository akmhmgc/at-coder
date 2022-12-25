require 'set'
INF = 10**6

box = Set.new
S = gets.chomp.split('')

store = Array.new(INF){Set.new}

count = 0
S.each do |c|
  if c == '('
    count +=1
  elsif c == ')'
    store[count].each do |i|
      box.delete(i)
    end
    store[count] = Set.new
    count -= 1
  else 
    b_count = box.count
    store[count] << c
    box << c
    a_count = box.count
    if b_count == a_count
      puts 'No'
      exit
    end
  end
end

puts "Yes"
