# QUESTION 1: #SORT_ARRAY_ASC

# build a method that sorts an array in ascending order
def sort_array_asc(array)
  array.sort_by { |w| w }
  # or array.sort will sort ascending automatically
end

# build a method that sorts an array in descending order

def sort_array_desc(array)
  array.sort_by { |w| -w }
  # alternative: array.sort_by {|x,y| y <=> x}
end

#Build a method swap_elements that takes in an array and swaps the second and third elements.

# Bonus Try building a method swap_elements_from_to that takes in 3 arguments, 
# array, index, destination_index, that will allow you to specify the index of 
# the element you would like to move to a new index. So:
# swap_elements_from_to(["a", "b", "c"],0,3) #=> ["c", "b", "a"]
# swap_elements_from_to(["a", "b", "c"],2,1) #=> ["a", "c", "b"]
# I originally iterated this one, but then realized there is no need as all we are doing it re-assigning and we only need select elements
def swap_elements(array)
    array[1],array[2] = array[2],array[1] # this is called parallel assignment; can use gsub too I guess
    array
end

# reverse the order of an array
def reverse_array(array)
  array.collect.with_index {|word, i| array[-(i+1)]}
  # array.reverse
end

# taking an array as an input, change the 3rd character of each element to a dollar sign.
def kesha_maker(array)
  array.each {|word| word[2] = "$"}
  # I actually tried with gsub, but Ruby makes assigning variable to a certain position in an array easy
end

# Build a method that takes in an array of integers and returns a hash 
# that has grouped the integers in the original array into appropriate keys 
# based on whether the integer is < 10. You could do this with some low level iterators, 
#  each and collect. Try those first, see what logic gets removed, 
#  or encapsulated into the higher level iterator, 
#  and then finally see if you can use an even higher level iterator that allows you to find, 
#  select, or detect elements in a collection that meet a certain requirement. Hint hint...
# Bonus There's something called inject or each_with_object that might allow 
# you to even abstract away out explicitly defining the return value's hash.

def greater_and_less_than_10(array)
  array.each_with_object({"greater_than_10" => [], "less_than_10" => []}) {|int, hash| int > 10 ? hash["greater_than_10"] << int : hash["less_than_10"] << int}  
end
# greater_than_10 and less_than_10 are from the test suite

def find_winners(hash)
  # hash = {name1 => winner, name2 => loser }
  new_array = []
  hash.select {|k,v| new_array << k if v == "winner"}
  new_array
end

# Build a method find_a that returns all the strings in the array passed to it 
# that start_with? the letter a. You'll want to use a high level iterator for 
# this that finds, selects, or detects elements based on a condition.
# using collect or select?

def find_a(array)
  array.select {|string| string.start_with?("a") ? string : nil }#.compact -- works without compacting
  # .select is the method we need, not .collect or .map
end

# Build a method sum_array that sums all the integers in the array.
# Bonus Try using inject or each_with_object here.

def sum_array(array)
  array.inject{|sum,x| sum+x}
  # http://stackoverflow.com/questions/1538789/how-to-sum-array-of-numbers-in-ruby
end

# sum = 0
# array.each {|num| sum += num }

# Add an "s" to each word in the array except for the 2nd element in the array
# if we just use collect, it will return 'nil' where 2nd element was, and that will be a pain to replace
def add_s(array)
  array.collect.with_index {|word,i| (i != 1) ? word+"s" : word}
end


# Build a method that creates a histogram of the words in a story, 
# which is to say, that it returns a hash where every key is a word in the story 
# and the value of that key is the count of how many times that word occurs in the story. 
# There's a tip in the test suite that might make this easier. 
# Get it working and then experiment with a few ways to make it more elegant.

# count_words return a hash whose keys are each word in the story 
# and the value is the number of occurences of that word
def count_words(words)
  my_array = words.split(" ") # split turns string into an array
  counts = Hash.new 0
  my_array.each do |word|
    counts[word] += 1
  end
  counts
  # my_array.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
end

def organize_songs_by_artist(array)
  new_hash = {}
  new_array = []
  array.each do |song1|
    new_array << song1.split(" - ")

    new_array.each do |song2|
      new_hash[song2[0]] = []
      new_hash[song2[0]] << song2[1]
    end
  end
  new_hash
end

=begin
  new_hash = {} # initializes an empty hash
  array.map {|song| song.split(" - ")}.each do |k,v|
    new_hash[k] == nil ? new_hash[k]=[v] : new_hash[k] << [v]
  end
  new_hash
=end

=begin
["dave matthews band - tripping billies", 
                "dave matthews band - #41", 
                "calvin harris - some techno song", 
                "avicii - some other dance song", 
                "oasis - wonderwall", 
                "oasis - champagne supernova"]
=end
                
