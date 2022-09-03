N = gets.to_i
H = []
S = []

N.times do
  hs = gets.chomp.split.map(&:to_i)
  H << hs[0]
  S << hs[1]
end

def ok(score)
  seconds = []

  N.times do |i|
    second = (score - H[i]) / S[i]

    seconds << second
  end
  seconds.sort!
  flag = true

  N.times do |i|
    flag = false if i > seconds[i]
  end

  flag
end

puts (1..10**24).bsearch { |v| ok(v) }


