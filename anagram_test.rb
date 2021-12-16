#!/usr/bin/env ruby

require 'set'
require 'pp'

# (cat,act) returns true
def anagram_cmp(s1,s2)
  return s1.split(//).to_set() == s2.split(//).to_set()
end

# (cat,act) returns true
def compare_strings_as_anagram(s1,s2)
  sum1=s1.split(//).inject(0) { |s,x| s+x.ord() }
  sum2=s2.split(//).inject(0) { |s,x| s+x.ord() }
  return sum1==sum2
end

# Return list of anagrams for s1
# from slist
def get_anagram(s1,slist)
  ret_list=[]
  slist.each { |x|
    next if x==s1
    #if anagram_cmp(s1,x)
    if compare_strings_as_anagram(s1,x)
      ret_list.append(x)
    end
  }
  return ret_list
end


def main()
  test_list=["cat","rat","tac","act"]
  anagram_list={}
  test_list.each {
    |x|
    anagram_list[x]=get_anagram(x,test_list)
  }
  pp(anagram_list)
end

main()
