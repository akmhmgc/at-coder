class User
  # getterメソッド
  def name
    @name
  end

  # setterメソッド
  def name=(name)
    @name = name
  end

  def initialize(name)
    @name = name
  end

  def hoge
    # v1にはnameが入る
    # v1 = self.name と同じ意味
    v1 = name
    puts v1 
  end

  def fuga
    # setterではなく単にnameというローカル変数を定義しただけ…！！
    name = '次郎'
  end
end


user = User.new('太郎')

user.hoge
# => '太郎'

# @nameは変更されない
user.fuga

user.name
#=> '太郎'

