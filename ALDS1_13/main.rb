K = gets.to_i
queens = Array.new(K) { gets.chomp.split.map(&:to_i) }

# 全ての組み合わせ
X = (0..7).to_a
Y = (0..7).to_a.permutation(8)

Y.each do |cols|
  rows = X
  rc = [rows, cols].transpose
  next if (rc & queens).size != K

  # 同じ列にいるならスキップ
  next if cols.uniq.size != 8

  # 1行目まで斜めに持ってきたときの座標
  val_lefts = []
  val_rights = []
  rc.each do |r, c|
    val_lefts << r - c
    val_rights << r + c
  end
  next if val_lefts.uniq.size + val_rights.uniq.size < 16

  arr = Array.new(8) { Array.new(8, false) }
  rc.each do |i,j|
    arr[i][j] = true
  end
  arr.each do |row|
    puts row.map{|v| v ? 'Q' : '.'}.join
  end
end
