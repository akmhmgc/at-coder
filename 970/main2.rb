N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

def rec(v, been, finished)
  been[v] = true
  G[v].each do |v2|
    if been[v2] == true
      if finished[v2] == false
        puts 'Yes'
        exit
      else
        next
      end
    else
      rec(v2, been, finished)
    end
  end
  finished[v] = true
end

been = Array.new(N, false)
finished = Array.new(N, false)

0.upto(N-1) do |i|
  next if been[i] == true

  rec(i, been, finished)
end

puts 'No'
