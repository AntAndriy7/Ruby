def calculate_f(a, b, c, x)
  ac = a.to_i
  bc = b.to_i
  cc = c.to_i
  xc = x.to_i

  condition = (ac | bc) & (ac | cc)

  if condition != 0
    if (xc + 5) < 0 && cc == 0
      result = 1.0 / (a * xc - b)
    elsif (xc + 5) > 0 && cc != 0
      result = (xc - a) / xc
    else
      result = 10 * xc / (cc - 4)
    end
  else
    result = (xc + 5)
  end

  result
end

x_start = 1.0
x_end = 5.0
dx = 1.0

puts "X\tF(X)"
a = 2.0
b = 3.2
c = 4.5
x = x_start
while x <= x_end
  f_x = calculate_f(a, b, c, x)
  puts "#{x}\t#{f_x}"
  x += dx
end

puts "\nX\tF(X)"
a = 1.5
b = 0.7
c = 2.3
x = x_start
while x <= x_end
  f_x = calculate_f(a, b, c, x)
  puts "#{x}\t#{f_x}"
  x += dx
end

puts "\nX\tF(X)"
a = 2.5
b = 2.0
c = 3.5
x = x_start
while x <= x_end
  f_x = calculate_f(a, b, c, x)
  puts "#{x}\t#{f_x}"
  x += dx
end