### 二分探索とSet
辞書順に並べた後に配列の中に存在するかどうかをチェックするのは二分探索ではなくSetで十分

### remainの計算方法
```ruby
# 下の方がわかりやすい
remain = S.inject(16){|r,i| r - i.length} - (N - 1)
remain = 16 - S.map(&:length).sum - (N - 1)
```
