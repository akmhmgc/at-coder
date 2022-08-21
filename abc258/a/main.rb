K = gets.to_i

h = 21 + K / 60
m = K % 60


puts  "#{format('%02d', h)}:#{format('%02d', m)}"
