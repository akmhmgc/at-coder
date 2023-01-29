require 'set'
N,M = gets.chomp.split.map(&:to_i)
S = []
T = Set.new
N.times do 
  S << gets.chomp
end

M.times do
  T << gets.chomp
end

count = 0

S.each do |si|
  three = si[-3..-1]
  count += 1 if T.include?(three)
end

p count
