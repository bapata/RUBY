#!/usr/bin/ruby

## How do I use ruby to construct template - Use HERE doc

def add_two(a,b)
  return a+b
end

def sub_two(a,b)
  return a-b
end

def this_year()
  return Time.new().year()
end

big_str=<<BSTR1
  Dear Sir,
    You owe us #{add_two(1,5)} dollars for the year #{this_year()}

             Thanks,
             AB and company
BSTR1

puts big_str
