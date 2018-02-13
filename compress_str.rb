#!/usr/bin/ruby

# Given input string, this script compresses the string
# Example:
# <this-script> "aabbbcccc"
# OUTPUT: 2a3b4c

in_word,=ARGV
if !in_word
  puts "USAGE: <script> <word-pattern>"
  exit(0)
end

myhash={}
clist=in_word.split(//) # create array of characters
# We need a uniq list to preserve order
uniq_list=clist.uniq()

# Count number of occurrences
clist.each do |x|
  if myhash.has_key?(x)
    myhash[x] = myhash[x] + 1
  else
    myhash[x] = 1
  end
end

# Output in desired format
uniq_list.each do |y|
  printf("%s",myhash[y].to_s() + y)
end
# additional newline
puts
