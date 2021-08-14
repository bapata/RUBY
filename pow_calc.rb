#!/usr/bin/env ruby

ARGV.each {
  |num|
  puts num + "," + (num.to_f()**num.to_f()).to_s()
}

# ./pow_calc.rb  0.1 0.01 0.001 0.0001 0.0000001 0.0000000001 0.00000000000000001 0.000000000000000001
# 0.1,0.7943282347242815
# 0.01,0.954992586021436
# 0.001,0.9931160484209338
# 0.0001,0.9990793899844618
# 0.0000001,0.9999983881917339
# 0.0000000001,0.9999999976974149
# 0.00000000000000001,0.9999999999999996
# 0.000000000000000001,1.0
