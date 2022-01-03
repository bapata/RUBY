
#!/usr/bin/env ruby
# Given a list of words, find all pairs of unique indices such that the concatenation of the two words is a palindrome.

str_list=["code", "edoc", "da", "d"]

palin_pairs=[]
str_list.each {
  |x|
  str_list.each {
    |y|
    next if x==y
    if (x+y)==(x+y).reverse()
		  pairs = "#{str_list.find_index(x)},#{str_list.find_index(y)}"
      palin_pairs.append(pairs)
    end
  }
}
palin_pairs.each { |y| puts y }
