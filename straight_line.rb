#!/usr/bin/ruby

eqn, = ARGV
#puts eqn

m=0
yi=0

if (eqn =~ /y\=(\-)?(\d+)x([-|+])?(\d+)/)
  puts "FORM:SLOPE_INTERCEPT:y=mx+c"
  m=($1=='-') ? $2.to_i()*(-1) : $2.to_i()
  yi=($3=='-') ? $4.to_i()*(-1): $4.to_i()
elsif (eqn =~ /(\-)?(\d+)(x)([+|-])(\d+)(y)=(\-)?(\d+)/)
  puts "FORM:STANDARD_FORM:ax+by=c"
  A=($1=='-') ? $2.to_i()*(-1):$2.to_i()
  B=($4=='-') ? $5.to_i()*(-1):$5.to_i()
  C=($7=='-') ? $8.to_i()*(-1):$8.to_i()
  m=(-1.0)*(A)/(B)
  yi= (1.0)*(C)/(B)
elsif (eqn =~ /(y)([-|+])(\d+)(=)(\-)?(\d+)(\()(x)([-|+])(\d+)(\))/)
  puts "FORM:POINT_SLOPE:y-y1=m(x-x1)"
  m=$6.to_i()
  m=($5=='-') ? (-1)*(m):m
  y1=$3.to_i()
  if ($2 == '+')
    y1 = (-1) * y1;
  end
  x1=$10.to_i()
  if ($9 == '+')
    x1 = (-1)*(x1)
  end
  yi=(-1)*(m)*(x1) + y1
else
  puts "Unrecognized form. Please try again ..."
  exit(0)
end

## report stuff
puts "Slope: " + m.to_s()
puts "Y intercept: " + yi.to_s()
