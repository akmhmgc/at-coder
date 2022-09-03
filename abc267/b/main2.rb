S = gets.chomp.split('').map(&:to_i)

if S[0] == 1
  puts 'No'
  exit
end

S.unshift(0)

# ぜんぶたおれている false
line = Array.new(7,true)

line[0] = false if S[7] == 0
line[1] = false if S[4] == 0
line[2] = false if S[8] == 0 && S[2] == 0
line[3] = false if S[5] == 0
line[4] = false if S[9] == 0 && S[3] == 0
line[5] = false if S[6] == 0
line[6] = false if S[10] == 0

flag = false

0.upto(6) do |i|
  0.upto(i-1) do |j|
    next unless line[i] && line[j]

    j.upto(i) do |k|
      flag = true if line[k] == false
    end
  end
end

puts flag ? 'Yes' : 'No'
 