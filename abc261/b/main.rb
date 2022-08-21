N = gets.to_i
A = Array.new(N) { gets.chomp.split('') }



def ok(val1, val2)
  return true if val1 == "D" && val2 == "D"
  return true if val1 == "W" && val2 == "L"
  return true if val1 == "L" && val2 == "W"
  return true if val1 == "-" && val2 == "-"
  
  false
end


a = A
a_t = A.transpose


N.times do |i|
  N.times do |j|
    next if ok(a[i][j], a_t[i][j])

    puts 'incorrect'
    exit
  end
end

puts 'correct'


Class 
