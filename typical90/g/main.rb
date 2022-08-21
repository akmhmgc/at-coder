n = gets.to_i
a = [-10**10] + gets.chomp.split.map(&:to_i).sort + [10**10]
q = gets.to_i
b = Array.new(q) { gets.to_i }


b.each do |qi|
  idx = a.bsearch_index { |x| x >= qi }
  puts [(a[idx] - qi).abs, (a[idx - 1] - qi).abs].min
end
