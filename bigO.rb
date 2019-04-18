require 'byebug'

def my_min(arr)
    result = nil

    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            if result.nil?
                result = arr[i]
            end
            if arr[j] < result 
                # debugger
                result = arr[j]
            end
        end
    end
    result
end

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

def new_my_min(arr)
    min = nil
    (0...arr.length-1).each do |i|
        if min.nil? || arr[i] < min
            min = arr[i]
        end
    end
    min
end

# p new_my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

def largest_contiguous_subsum(list)
    largest_subsum = nil
    (0...list.length).each do |i|
        (i...list.length).each do |j|
            pair_sum = list[i..j].sum
            if largest_subsum.nil? || pair_sum > largest_subsum
                largest_subsum = pair_sum
            end
        end
    end
    largest_subsum

end



# 2
# 5
# -1
# 6
# 0
# 7 ***

# 3 
# -3
# 4
# -2
# 5 ***

# -6
# 1 ***
# -5
# 2 ***

# 7
# 1
# 8 ****************

# -6
# 1 ***

# 7 ***


def new_largest_contiguous_subsum(list)
    largest_subsum = nil
    if list.none? {|el| el > 0}
        return list.max
    else
        curr_subsum = 0
    end

    i = 0
    while i < list.length
        while curr_subsum >= 0 && i < list.length
            # debugger
            curr_subsum += list[i]
            largest_subsum = curr_subsum if largest_subsum.nil? || curr_subsum > largest_subsum
            i+=1
        end
        curr_subsum = 0
    end
    largest_subsum
end

# p new_largest_contiguous_subsum([2, 3, -6, 7, -6, 7])
# p new_largest_contiguous_subsum([-5, -1, -3])