def factorial(n)
   if(n==1)
    return 1
   else
    return n * factorial(n-1)
   end
end


def sum_upto(n)
   if(n==1)
    return 1
   else
    return n + sum_upto(n-1)
   end
end

puts sum_upto(10);
puts factorial(10);
