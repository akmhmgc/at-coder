# n = gets.chomp.to_i
# n,m = gets.chomp.split.map(&:to_i)
# arr = gets.chomp.split.map(&:to_i)

n = gets.chomp.to_i
arr = ('a'..'z').to_a

puts arr[n - 97]
