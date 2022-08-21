N = gets.to_i
A = gets.chomp.split.map(&:to_i)
B = gets.chomp.split.map(&:to_i)
C = gets.chomp.split.map(&:to_i)

abc = Array.new(3) { Array.new(46, 0) }

[A, B, C].each_with_index do |n, idx|
  n.each do |i|
    mod = i % 46
    abc[idx][mod] += 1
  end
end


count = 0

abc[0].each_with_index do |ai, id_a|
  abc[1].each_with_index do |bi, id_b|
    abc[2].each_with_index do |ci, id_c|
      next if ai.zero? || bi.zero? || ci.zero?

      count += ai * bi * ci if ((id_a + id_b + id_c) % 46).zero?
    end
  end
end

puts count
