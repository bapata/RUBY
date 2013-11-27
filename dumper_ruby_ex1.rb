#!/usr/bin/ruby

require 'pp'
require 'YAML'
#require 'awsome_print'
#require 'ap'

# DS1
my_hash1={:one => [ 1, 11, 111] , :two => { :twotwo => 222 } }

# Dumper
puts "Pretty print"
pp my_hash1

## YAML output
puts "YAML output:"
y my_hash1

## AWSOME output
#puts "AWSOME output:"
#ap my_hash1
