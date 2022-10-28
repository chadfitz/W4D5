def first_anagram?(word_1, word_2)
  permutations = word_1.split("").permutation.to_a
  permutations.join("").include?(word_2)
end
# O(n!)
# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(word_1, word_2)
  array_2 = word_2.split("")
  word_1.each_char do |char|     #O(n)
    if word_2.include?(char)      #O(n)
      array_2.delete_at(array_2.find_index(char)) #O(n)
    else 
      return false
    end
  end
  true
end 
# O(n^3)
# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(word_1, word_2)
  array_1 = word_1.split("")
  array_2 = word_2.split("")
  array_1.sort == array_2.sort
end
# 2(n log n) => O(n log n)
#how does == work in checking equality? 
#implemented differently depending on what you're checking equality on
#for arrays it would be O(n). simultaneously iterating through each array
#and checking they are the same. for arrays == checks value equality.
# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(word_1, word_2)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)
  word_1.each_char do |char| #O(n)
    hash_1[char] += 1
  end
  word_2.each_char do |char| #O(n)
    hash_2[char] += 1
  end
  hash_1 == hash_2
end
#O(3n) => #O(n)
# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

def hash_anagram?(word_1, word_2)
  hash = Hash.new(0)
  word_1.each_char do |char| #O(n)
    hash[char] += 1
  end
  word_2.each_char do |char| #O(n)
    hash[char] -= 1
  end
  hash.values.none? { |value| value > 0 } #O(n)
end
#O(3n) => #O(n)
p hash_anagram?("gizmo", "sally")    #=> false
p hash_anagram?("elvis", "lives")    #=> true