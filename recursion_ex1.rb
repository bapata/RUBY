#!/usr/bin/env ruby

# factorial(3) = 1*2*3
def factorial(n)
   if(n==1)
    return 1
   else
    return n * factorial(n-1)
   end
end


# sum_upto(3) = 1+2+3
def sum_upto(n)
   if(n==1)
    return 1
   else
    return n + sum_upto(n-1)
   end
end


# Return sum of all elements in a list
# add_all([1,2]) #=>3

def add_all(list)
  if list.length() == 1
    return list[0]
  else
    return list[0] + add_all(list[1..list.length()-1])
  end
end

# Return product of all elements in a list
# prod_all([1,2]) #=>2

def prod_all(list)
  if list.length() == 1
    return list[0]
  else
    return list[0] * prod_all(list[1..list.length()-1])
  end
end

sum = sum_upto(10)
puts "Sum of all numbers upto 10 is #{sum}"
product = factorial(10)
puts "Factorial of 10 is #{product}"
mylist=[1,2,3,4]
sum = add_all(mylist)
puts "Sum of all numbers in #{mylist} is #{sum}"
prod = prod_all(mylist)
puts "Product of all numbers in #{mylist} is #{prod}"
exit(0)
