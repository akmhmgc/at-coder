list = [
  [1, 2],
  [1, 3],
  [4, 1],
  [5, 2],
  [10, 2]
]

p list.min_by{ |v| v.first }
p list.min_by(&:last)
