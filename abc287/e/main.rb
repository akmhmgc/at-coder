N = gets.to_i
S = []
N.times do
  S << gets.chomp
end

def lpc(s1,s2)
  count = 0
  s1_chars = s1.split('')
  s2_chars = s2.split('')
  l = [s1.length, s2.length].min

  l.times do |i|
    break unless s1_chars[i] == s2_chars[i]
    
    count += 1
  end
  count
end


LCP = []

sorted_S = S.sort

(N-1).times do |i|
  s1 = sorted_S[i]
  s2 = sorted_S[i + 1]
  LCP << lpc(s1, s2)
end

def binary_search(array, target)

  head = 0
  tail = array.count - 1

  while head <= tail

    center = (head + tail) / 2

    if array[center] == target
      return center
    elsif array[center] < target
      head = center + 1
    else
      tail = center - 1
    end
  end
end


S.each do |si|
  idx = binary_search(sorted_S, si)
  max = -1

  max = [max, LCP[idx - 1]].max if idx >= 1
  max = [max, LCP[idx]].max if idx < N - 1
  puts max
end
