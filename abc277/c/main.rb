require 'set'

N = gets.to_i

@go = Hash.new{|h,k|
  h[k] = Set.new
}

N.times do
  a, b = gets.chomp.split.map(&:to_i)
  @go[a] << b
  @go[b] << a
end

@max = 1
@gone = Set.new

def rec(v)
  return if @gone.include?(v)

  @max = [@max, v].max
  @gone << v

  @go[v].each do |v_next|
    rec(v_next)
  end
end

rec(1)

puts @max
