require "byebug"

# nested arrays, checking if j > i && ele1+ele2 == target
# O(n^2)

#array#each.with_index
#while i < array.length

def bad_two_sum?(arr, target)
    arr.each_with_index do |ele, i|
        arr.each_with_index do |ele2, j|
            if j > i && ele + ele2 == target
                return true
            end
        end
    end
    false
end
#O(n^2)

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

#1. sorting is O(n log n)
#2. puts a limit on possible worst case
#   allows us to use sorted methods

def okay_two_sum?(arr, target)
    arr.sort!                                           #O(n log n)

    arr.each_with_index do |ele, i|                     #O(n)
        if bsearch(arr[i+1..-1], (target-ele)) != nil   #O(log n) * n?
            return true
        end
    end
    false 
end

def bsearch(arr, target)                 
    mp = arr.length/2
    left = arr[0...mp]
    right = arr[mp+1..-1]

    return nil if arr.empty?
    
    if arr[mp] == target
        return mp 
    elsif arr[mp] < target
        index = bsearch(right, target)
        if index == nil
            return nil
        else
            return index + 1 + mp
        end
    elsif arr[mp] > target
        bsearch(left, target)
    end
end
#O(2 * (n log n)) => O(n log n)

# debugger
arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false