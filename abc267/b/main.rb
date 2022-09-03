S = gets.chomp.split('').map(&:to_i)

if S[0] == 1
  puts 'No'
  exit
end

S.unshift(0)

# ぜんぶたおれている 0
line = Array.new(7,1)

line[0] = 0 if S[7] == 0
line[1] = 0 if S[4] == 0
line[2] = 0 if S[8] == 0 && S[2] == 0
line[3] = 0 if S[5] == 0
line[4] = 0 if S[9] == 0 && S[3] == 0
line[5] = 0 if S[6] == 0
line[6] = 0 if S[10] == 0

one_ok = false
zero_ok = false
last_one_ok = false


7.times do |i|
  if line[i] == 1
    one_ok = true 
    i.upto(6) do |j|
      next if line[j] !=0
      zero_ok = true if line[j] == 0 && one_ok

      j.upto(6) do |k|
        next if line[k] !=1
        last_one_ok = true if one_ok && zero_ok
      end
    end
  end
end

puts (one_ok && zero_ok && last_one_ok) ? 'Yes' : 'No'
