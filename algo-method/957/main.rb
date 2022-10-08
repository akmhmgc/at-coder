N, M, S, T = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end

been = Array.new(N, false)

def rec(v, t, been)
  return if been[v] == true

  if v == t
    puts 'Yes'
    exit
  end

  been[v] = true

  G[v].each do |v_next|
    rec(v_next, t, been)
  end
end


rec(S,T, been)


puts 'No'
