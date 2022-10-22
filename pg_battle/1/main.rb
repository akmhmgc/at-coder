N,Q = gets.chomp.split.map(&:to_i)
query = Array.new(Q){gets.chomp.split.map(&:to_i)}

# 1を表とする
senbei = Array.new(N + 1, 1)

query.each do |qi|
  l,r = qi
  l.upto(r) do |j|
    senbei[j]*= -1
  end
end

puts senbei.count(-1)
