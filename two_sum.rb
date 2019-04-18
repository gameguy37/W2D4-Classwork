require'byebug'
nums = [1, 2, 3, 4, 6, -5, -3, -2, -1]

def bad_two_sum?(arr, target)
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            return true if ele2 + ele1 == target && i != j 
        end
    end
    false
    # O(n^2)
end

def okay_two_sum?(arr, target) #O (n log n) to sort it, then O(n) to return true/false
    sorted = arr.sort
    i = 0
    j = arr.length-1

    while i != j
        case sorted[i] + sorted[j] <=> target
        when -1
            i += 1
        when 0
            return true
        when 1
            j -= 1
        end
    end
    false
end

def two_sum?(arr, target)
    hash = Hash.new(0)

    arr.each do |ele|
        if !hash.has_key?(ele)
            hash[target-ele] = ele
        else
            return true
        end
    end
    false
end

# p bad_two_sum?(nums, 60)
# p bad_two_sum?(nums, 5)

# p okay_two_sum?(nums, 12) # => false
# p okay_two_sum?(nums, 10) # => true
# p okay_two_sum?(nums, 0) # => true
# p okay_two_sum?(nums, 7) # => true
# p okay_two_sum?(nums, -1) # => true
# p okay_two_sum?(nums, 11) # => false

p two_sum?(nums, 12) # => false
p two_sum?(nums, 10) # => true
p two_sum?(nums, 0) # => true
p two_sum?(nums, 7) # => true
p two_sum?(nums, -1) # => true
p two_sum?(nums, 11) # => false
