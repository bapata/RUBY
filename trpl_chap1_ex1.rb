#!/usr/bin/ruby

require 'pp'



# Printing class for each example
puts "String class example: " 
puts "usa".class
puts
puts false.class
puts nil.class

# Block examples
puts "times example:"
5.times { puts "once more" }
puts "Upto example:"
1.upto(9) { |x| puts x }

# Block operators
aa=[10,101,3,20,201,30,40,50]
puts aa

puts "Sqrt example:"
bb = aa.map { |x| Math::sqrt(x) }
puts bb

## selector
puts "Odd selector:"
cc=aa.select { |x| x%2!=0 }
puts cc

## Hash example
world_team = { 
               :india => 'dhoni',  
               :england => "jessie", 
               :aus => "richard",
               :sl => "ranatunga" }
pp world_team

world_team.each do |k,v| 
  puts "KEY:#{k}, VALUE:#{v} "
end
