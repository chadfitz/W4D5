require "byebug"

#my_min
##phase 1

def my_min(list)
    min = list.first
    list.each_with_index do |ele, i| #O(n)
        list.each_with_index do |ele2, j| #O(n)
            if j>i && ele2>ele && min>ele
                min = ele
            end
        end
    end
    min
end
#O(n^2)

##phase 2
def my_min2(list)
    min = list.first
    list.each do |ele| #O(n)
        min = ele if ele < min
    end
    min
end
#O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5

#Largest Contiguous Sub-sum
##phase 1
def largest_contiguous_subsum(list)
    sub_sums = []
    list.each_with_index do |num, i|
        sub_sums << [num]
        list.each_with_index do |num2, j|                           #O(n^2)
            sub_sums << list[i..j] if j < list.length && j > i
        end 
    end
    # (0...list.length).each do |first|
    #     (first...list.length).each do |last|
    #         sub_sums << list[first..last]
    #     end
    # end

    max_sum = 0
    sub_sums.each do |sub_sum|                                      #O(n)
        max_sum = sub_sum.sum if sub_sum.sum > max_sum
    end
    max_sum
end
#O(2n^2) => O(n^2)

def largest_contiguous_subsum2(list)
    largest_sum = 0
    current_sum = 0

    list.each_with_index do |ele, i|                                #O(n)
        # largest_sum = ele if ele > largest_sum
        current_sum += ele 
        if current_sum > largest_sum 
            largest_sum = current_sum
        elsif current_sum < 0
            current_sum = 0
        end
    end
    largest_sum
end
#O(n)

# debugger
list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])