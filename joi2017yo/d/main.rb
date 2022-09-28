# input of int(split by space)
def get_i
  gets.chomp.split(' ').map(&:to_i)
end

# input of float(split by space)
def get_f
  gets.chomp.split(' ').map(&:to_f)
end

# input of string(split by space)
def get
  gets.chomp.split(' ')
end

# input of string(split per one character)
def get_nsp
  gets.chomp.split('')
end

# yes or no decision
def yn_judge(bool, y = 'Yes', n = 'No')
  bool ? y : n
end

# create of array
def array(size1, init = nil, size2 = -1)
  if size2 == -1
    Array.new(size1) { init }
  else
    Array.new(size2) { Array.new(size1) { init } }
  end
end

def max(a, b)
  a > b ? a : b
end

def min(a, b)
  a > b ? b : a
end

INF = Float::INFINITY

N, M = get_i
sum = Array.new(N) { Array.new(M, 0) }
N.times do |i|
  num = gets.to_i
  sum[i][num - 1] += 1
end
accum = Array.new(N + 1) { Array.new(M, 0) }
N.times do |i|
  M.times do |j|
    accum[i + 1][j] = accum[i][j] + sum[i][j]
  end
end
# dp[i]:=集合iに含まれる種類のぬいぐるみを左端から配置した時、取り出すぬいぐるみの最小値
# ex) {3,4}: 左から3,4の順不同で配置する時に取り出す必要のある最小のぬいぐるみの数
dp = Array.new(1 << M, INF)
dp[0] = 0


(1 << M).times do |i|
  doll_cnt = 0
  M.times do |j|
    doll_cnt += accum[N][j] unless (i & (1 << j)) == 0
  end
  M.times do |j|
    next unless (i & (1 << j)) == 0

    doll_j = accum[N][j]
    # 渡すDPっぽい
    dp[i | (1 << j)] = [dp[i | (1 << j)], dp[i] + (doll_j - (accum[doll_cnt + doll_j][j] - accum[doll_cnt][j]))].min
  end
end
# puts dp[(1 << M) - 1]

puts dp[1]
puts dp[2]
puts dp[4]
