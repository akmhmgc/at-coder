# n = gets.chomp.to_i
# arr = gets.chomp.split.map(&:to_i)

n, k = gets.chomp.split.map(&:to_i)

# 最大値の食べ物を保存する
arr = []
foods = gets.chomp.split.map(&:to_i)
max = foods.max

foods.each.with_index do |food, idx|
  arr << idx + 1 if food == max
end

dislikes = gets.chomp.split.map(&:to_i)

puts (arr & dislikes).empty? ? 'No' : 'Yes'
