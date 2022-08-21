class Array
  def median
    midpoint = length / 2
    sorted = sort
    if length.even?
      sorted[midpoint - 1, 2].sum / 2.0
    else
      sorted[midpoint]
    end
  end
end



