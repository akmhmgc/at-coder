H1, W1 = gets.chomp.split.map(&:to_i)
A = Array.new(H1) { gets.chomp.split.map(&:to_i) }

H2, W2 = gets.chomp.split.map(&:to_i)
B = Array.new(H2) { gets.chomp.split.map(&:to_i) }

# 選ぶ数
H_diff = H1 - H2
W_diff = W1 - W2

flag = false

(1..H1).to_a.combination(H_diff).each do |remove_h|
  (1..W1).to_a.combination(W_diff).each do |remove_w|
    a = A.dup

    remove_h.reverse_each do |h|
      h -= 1
      a.delete_at(h)
    end
    a = a.transpose.dup
    remove_w.reverse_each do |w|
      w -= 1
      a.delete_at(w)
    end

    flag = true if a.transpose == B
  end
end

puts flag ? 'Yes' : 'No'
