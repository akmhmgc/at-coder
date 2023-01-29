S = gets.chomp.split('')
T = gets.chomp.split('')

# Sの最後のT文字分だけ調べる
s_length = S.length
t_length = T.length

# Sの最後のT文字分がマッチしているかどうか
D = Array.new(t_length, false)
true_count = 0

def ok(s, t)
  return true if s == t || s == '?' || t == '?'

  false
end

t_length.times do |i|
  si = S[s_length - t_length + i]
  ti = T[i]
  if ok(si, ti)
    D[i] = true
    true_count += 1
  end
end

# 最初の状態
puts true_count == t_length ? 'Yes' : 'No'

t_length.times do |i|
  # i番目がS[i]に変わる
  true_count -= 1 if D[i] == true
  si = S[i]
  ti = T[i]
  if ok(si, ti)
    true_count += 1
  end
  puts true_count == t_length ? 'Yes' : 'No'
end
