N = gets.to_i
V = Array.new(N) { gets.chomp.split.map(&:to_i) }

def distance(v1, v2)
  x1, y1 = v1
  x2, y2 = v2

  ((x1 - x2)**2 + (y1 - y2)**2)**0.5
end

bunbo = 0
bunshi = 0

[*0...N].permutation(N) do |com|
  bunbo += 1
  (N - 1).times do |i|
    v1 = V[com[i]]
    v2 = V[com[i + 1]]

    bunshi += distance(v1,v2)
  end
end

puts bunshi / bunbo
