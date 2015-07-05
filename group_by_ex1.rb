#!/usr/bin/env ruby

#
## Example to demonstrate use of group_by method (array and Hash)
#

def segregate_candidates(candidate_list, min_score_to_pass)
  return candidate_list.group_by { |name,marks| (marks>min_score_to_pass)? "PassedList":"FailedList" }
end

def main()
  my_candidate_list = { "Travis"=>42, "Jill"=>56, "Joe"=>86, "John"=>47, "Tom"=>36, "Susan"=>39 }
  result_list = segregate_candidates(my_candidate_list, 40)
  puts result_list
end

main()

# Expected output is as below
#{"PassedList"=>[["Travis", 42], ["Jill", 56], ["Joe", 86], ["John", 47]], "FailedList"=>[["Tom", 36], ["Susan", 39]]}
