#!/usr/bin/ruby

3.times { puts "I love cricket" }

all_places=['brice-canyon','sfo','grand-canyon','niagara','lake-taho','yellow-stone','seattle']
visited=['grand-canyon','niagara','sfo']
not_visited=all_places-visited
puts "Not visited :" 
not_visited.each { |place| puts place }
