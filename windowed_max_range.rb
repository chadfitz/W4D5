require "byebug"

def windowed_max_range(arr, w)
    current_max_range = nil
    arr.each_with_index do |ele, i|
        if i < arr.length-(w-1)
            window = arr[i...i+w]
            difference = window.max - window.min
            current_max_range = difference if (current_max_range == nil || difference > current_max_range)
        end
    end
    current_max_range
end
# debugger
p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8