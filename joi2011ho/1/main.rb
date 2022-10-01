H, W = gets.chomp.split.map(&:to_i)
N = gets.to_i
J = Array.new(H + 1) { Array.new(W + 1, 0) }
O = Array.new(H + 1) { Array.new(W + 1, 0) }
I = Array.new(H + 1) { Array.new(W + 1, 0) }

1.upto(H) do |i|
  gets.chomp.split('').each_with_index do |v, j|
    j += 1
    J[i][j] = 1 if v == 'J'
    O[i][j] = 1 if v == 'O'
    I[i][j] = 1 if v == 'I'
  end
end

CJ = Array.new(H + 1) { Array.new(W + 1, 0) }
CO = Array.new(H + 1) { Array.new(W + 1, 0) }
CI = Array.new(H + 1) { Array.new(W + 1, 0) }

1.upto(H) do |i|
  1.upto(W) do |j|
    CJ[i][j] += J[i][j] + CJ[i - 1][j] + CJ[i][j - 1] - CJ[i - 1][j - 1]
    CO[i][j] += O[i][j] + CO[i - 1][j] + CO[i][j - 1] - CO[i - 1][j - 1]
    CI[i][j] += I[i][j] + CI[i - 1][j] + CI[i][j - 1] - CI[i - 1][j - 1]
  end
end

ans = []
N.times do
  x1, y1, x2, y2 = gets.chomp.split.map(&:to_i)
  ans << [CJ[x2][y2] - CJ[x2][y1 - 1] - CJ[x1 - 1][y2] + CJ[x1 - 1][y1 - 1],
          CO[x2][y2] - CO[x2][y1 - 1] - CO[x1 - 1][y2] + CO[x1 - 1][y1 - 1],
          CI[x2][y2] - CI[x2][y1 - 1] - CI[x1 - 1][y2] + CI[x1 - 1][y1 - 1]]
end

ans.each{|line| puts line * ' c'}
