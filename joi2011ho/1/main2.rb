M, N = gets.chomp.split.map(&:to_i)
K = gets.to_i
J = Array.new(M) { Array.new(N, 0) }
O = Array.new(M) { Array.new(N, 0) }
I = Array.new(M) { Array.new(N, 0) }

M.times do |i|
  line = gets.chomp.split('')
  N.times do |j|
    J[i][j] = 1 if line[j] == 'J'
    O[i][j] = 1 if line[j] == 'O'
    I[i][j] = 1 if line[j] == 'I'
  end
end

class CumulativeSum_2D
  def initialize(d)
    h, w = d.size, d[0].size
    @d = Array.new(h+1){Array.new(w+1, 0)}
    (0...h).each{|i|
      wk, di, dii, dp = 0, d[i], @d[i], @d[i+1]
      (0...w).each{|j|
        wk += di[j]
        dp[j+1] = wk + dii[j+1]
      }
    }
  end
  # (a,b) (y,x)囲まれた空間
  def calc(y, x, a, b)
    dy, da = @d[y], @d[a-1]
    dy[x] - dy[b-1] - da[x] + da[b-1]
  end
end

CUMSUM_J = CumulativeSum_2D.new(J)
CUMSUM_O = CumulativeSum_2D.new(O)
CUMSUM_I = CumulativeSum_2D.new(I)

def calc(y, x, a, b)
  [
    CUMSUM_J.calc(y, x, a, b),
    CUMSUM_O.calc(y, x, a, b),
    CUMSUM_I.calc(y, x, a, b),
  ]
end

ans = []
K.times do
  a, b, y, x = gets.chomp.split.map(&:to_i)
  ans << calc(y, x, a, b)
end

ans.each{|line| puts line * ' '}
