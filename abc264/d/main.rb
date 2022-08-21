S = gets.chomp

hash = {
  'a': 0,
  't': 1,
  'c': 2,
  'o': 3,
  'd': 4,
  'e': 5,
  'r': 6
}

str = S.chars.map { |c| hash[c.to_sym] }

@count = 0
def bubble_sort(data)
  length = data.length 
  for i in 0..(length-1) 
    for j in 1.. (length-i-1) 
      if data[j-1] > data[j] 
        @count += 1
        data[j-1],data[j] = data[j],data[j-1] 
      end
    end
  end
end

bubble_sort(str)
puts @count
