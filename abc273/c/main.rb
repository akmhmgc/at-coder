require 'set'

N = gets.to_i
A = gets.chomp.split.map(&:to_i)

sorted = A.to_set.to_a.sort
length = sorted.length

counts = Array.new(N, 0)

A.each do |ai|
  start = sorted.bsearch_index{|v| v > ai} || length
  count = length - start
  counts[count] += 1
end

counts.each do |c|
  puts c
end
