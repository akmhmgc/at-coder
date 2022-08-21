# @file = File.open('file.txt', 'r')

# def gets
#   @file.gets
# end

# n = gets.to_i

# ans = []

# n.times do |i|
#   row = []

#   (i + 1).times do |j|
#     val = j.zero? || j == i ? 1 : ans[i - 1][j] + ans[i - 1][j - 1]
#     row << val
#   end
#   ans << row
# end

# ans.each { |row| puts row.join(' ') }

require 'set'
list = [1, 2, 5, 4, 3]
sorted_list = list.sort

flag = true
i = 0
while i < list.length - 1
  if sorted_list[i] == sorted_list[i + 1]
    flag = false
    break
  end
  i += 1
end

puts flag ? 'Yes': 'No'


