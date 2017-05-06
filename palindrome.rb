#!/usr/bin/ruby

# Script to check if a given word is a palindrome
# Usage: ./palindrome.rb <word-to-test>
# Example: ./palindrome.rb bob # output: bob is a palindrome
#          ./palindrome.rb bobo # output: bobo is not a palindrome

# Main starts here
word,= ARGV
puts "#{word} is " + (word == word.reverse() ? "a palindrome" : "not a palindrome")
