S = gets.chomp.chars
h = {}
S.each do |str|
  h[str] = h[str].to_i + 1
end

h = h.filter { |_k, v| v == 1 }
puts h.to_a.empty? ? -1 : h.to_a.first[0]
