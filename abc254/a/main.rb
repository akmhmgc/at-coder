@file = File.open('file.txt', 'r')

def gets
  @file.gets
end

n = gets.to_i

arr = []

n.times do |i|
  # i個の数からなる行
  arr << [1] if i.zero?

  row = Array.new(i)
  i.times do |j|
    if j.zero? || j == i
      row[j] = 1  
    else
      row[j] = arr[i -1 ][j] + arr[i -1 ][j - 1]
    end 
  end
  arr << row
end

p arr
