N, P, Q, R = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

cumsum = Array.new(N+1, 0)
cumsum[0] = 0

N.times do |i|
  cumsum[i + 1] = cumsum[i] + A[i]
end

flag = false

N.times do |i|
  diff = cumsum[i]
  idx_p = cumsum.bsearch_index{|v| v >= diff + P }
  next if idx_p.nil? || cumsum[idx_p] != diff + P

  idx_q = cumsum.bsearch_index{|v| v >= diff + P + Q }
  next if idx_q.nil? || cumsum[idx_q] != diff + P + Q

  idx_r = cumsum.bsearch_index{|v| v >= diff + P + Q + R }
  next if idx_r.nil? || cumsum[idx_r] != diff + P + Q + R

  flag = true
end

puts flag ? 'Yes' : 'No'
