users = [
  ['takashi', 168],
  ['ken', 178],
  ['yoshiki', 158]
]

# 配列の二番目の値を基準にして最小値の配列を取り出したい場合
users.min_by { |a| a[1] } #=> ["yoshiki", 158]

# 普通にminを呼ぶと配列の一番目の比較になる
users.min #=> ["ken", 178](文字列が早い順番)
