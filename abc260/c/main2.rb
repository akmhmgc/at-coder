N, X, Y = gets.chomp.split.map(&:to_i)

if N < 2
  puts 0
  exit
end

# def f(level, is_red)
#   if is_red
#     return 1 if level == N

#     (X + 1) * f(level + 1, true) + f(level + 1, false)
#   else
#     return 0 if level == N

#     Y * f(level + 1, false) + X * Y * f(level + 1, true)
#   end
# end

# def f(level, is_red)
#   if is_red
#     return X if level == N - 1

#     f(level + 1, true) + f(level + 1, false)
#   else
#     return X * Y if level == N - 1

#     Y * f(level + 1, false) + X * f(level, true)
#   end
# end

def f(level, is_red)
  if !is_red
    return 0 if level == N

    Y * f(level + 1, false) + X * f(level, true)
  else
    return 1 if level == N

    f(level + 1, true) + f(level + 1, false)
  end
end


puts f(1, false)
