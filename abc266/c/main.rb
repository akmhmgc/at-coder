Ax, Ay = gets.chomp.split.map(&:to_i)
Bx, By = gets.chomp.split.map(&:to_i)
Cx, Cy = gets.chomp.split.map(&:to_i)
Dx, Dy = gets.chomp.split.map(&:to_i)

flag = true

AB = [Bx - Ax, By - Ay]
AD = [Dx - Ax, Dy - Ay]

flag = false if AB[0]*AD[1] - AB[1]*AD[0] < 0


BC = [Cx - Bx, Cy - By]
BA = [Ax - Bx, Ay - By]

flag = false if BC[0]*BA[1] - BC[1]*BA[0] < 0

CD = [Dx - Cx, Dy - Cy]
CB = [Bx - Cx, By - Cy]

flag = false if CD[0]*CB[1] - CD[1]*CB[0] < 0

DA = [Ax - Dx, Ay - Dy]
DC = [Cx - Dx, Cy - Dy]

flag = false if DA[0]*DC[1] - DA[1]*DC[0] < 0

puts flag ? 'Yes' : 'No'
