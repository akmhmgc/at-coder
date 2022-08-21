## `or`と`||`どちらが優勢か？'
- `||`の方が優勢
- どちらも左からture or falseが決まるまで実行
- `puts 'msg'`は返り値が`nil`なので`puts 'hogehoge' and return`書いても`nil`が返った時点で処理が終わる
  ```ruby
  puts 'hoge' and return
  # => puts 'hoge'がnilを返すのでreturnは呼ばれない
  ```

## 問題文の理解
- input outputを見るのが早すぎる

## 多次元配列
```ruby
Array.new(4) { Array.new(10, 0) } }
```

## 数行の入力を配列で受け取る
```ruby
# n行の空白で区切られた入力を受け取る
a = Array.new(n){ gets.to_s.split.map(&:to_i) }
```

## Arrayの同じインデックス同士の足し算
```ruby
a = [1,2,3]
b = [4,5,6]

# 四則演算
[a,b].transpose.map{|arr| arr.inject(:+)}
```

## よくするミス
- Arrayにnewをつけ忘れる
  - エラーが出ないので注意
    ```ruby
    Array(3){Array.new(3,0)}
    # => [3]
    ```

## 大文字と小文字の入れ替え
```ruby
'fAIR, LATER, OCCASIONALLY CLOUDY.'.swapcase
# => "Fair, later, occasionally cloudy."
```

## inject
初期値を与えない場合はEnumerableの先頭の値が入る
`inject(init = self.first) {|result, item| ... } -> object`

```ruby
[1,2,3,4,5].inject{|result,num| result + num }
```

## 文字<=> ASCIIコード
```ruby
97.chr
#=> a

a.ord
#=> 97
```


## C
### 課題
- そもそも計算量の見積もりができていなかった
  - どう実装しても計算量がO(N^2)のアルゴリズムを書いていた
