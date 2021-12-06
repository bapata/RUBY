#!/usr/bin/env ruby

require 'pp'

# Check if specified number is a Armstrong number or not
# USAGE: <this-script> <number>


def is_armstrong(n)
  n_str=n.to_s()
  char_list=n_str.split(//)
  int_list=char_list.map {|x| (x.to_i())**(n_str.length()) }
  mysum = int_list.reduce(0) { |sum, num| sum + num }
  return (mysum==n)
end

# Main starts here
number,= ARGV
if !number
  puts "USAGE: <this-script> <number>"
  exit(1)
end

if is_armstrong(number.to_i())
  puts number + " is a Armstrong number"
else
  puts number + " is NOT a Armstrong number"
end
