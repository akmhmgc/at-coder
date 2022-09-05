N ,K = gets.chomp.split.map(&:to_i)

S = []
N.times do 
  chs = gets.chomp.chars
  hash = Hash.new(0)
  chs.each{|c| hash[c] = 1}
  S << hash  
end

p S

# i個数選択してOKかどうか
def ok(i)
  flag = false
  (0..15).to_a.combination(i).each do |com|
    com.each do |i|
      
    end
  end
end


ok(2)
