#!/usr/bin/env ruby

#
## Example to demonstrate use of group_by method (array and Hash)
#

def segregate_candidates(candidate_list, min_score_to_pass)
  return candidate_list.group_by { |name,marks| (marks>min_score_to_pass)? "PassedList":"FailedList" }
end

def even_or_odd(number_list)
  return number_list.group_by { |number| (number % 2 == 0) ? "EvenList":"OddList" }
end

def main()
  my_candidate_list = { "Travis"=>42, "Jill"=>56, "Joe"=>86, "John"=>47, "Tom"=>36, "Susan"=>39 }
  result_list = segregate_candidates(my_candidate_list, 40)
  puts result_list

  # Array Example
  number_list1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]
  result_list = even_or_odd(number_list1)
  puts result_list
end

main()

# Expected output is as below
#{"PassedList"=>[["Travis", 42], ["Jill", 56], ["Joe", 86], ["John", 47]], "FailedList"=>[["Tom", 36], ["Susan", 39]]}
#{"OddList"=>[1, 3, 5, 7, 9, 11, 13, 15, 17], "EvenList"=>[2, 4, 6, 8, 10, 12, 14, 16]}
