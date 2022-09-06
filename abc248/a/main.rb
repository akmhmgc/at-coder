S = gets.chomp.split('').map(&:to_i).sort

(0..9).each_with_index do |i,idx|
  if i != S[idx]
    puts i 
    exit
  end
end



