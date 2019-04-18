def first_anagram?(word1, word2) # O(n!)
    anagrams = word1.chars.permutation.to_a.uniq
    anagrams.include?(word2.chars)
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

def second_anagram?(word1, word2) # O(n^2)
    word1.each_char do |char|
        unless word2.chars.index(char) == nil 
            word2.delete!(char)
        end
    end
    return word2 == ""
end

#p second_anagram?("gizmo", "sally")
#p second_anagram?("elvis", "lives")

def third_anagram?(word1, word2)
    word1.chars.sort == word2.chars.sort #sort is quicksort under the hood so O(n^2) worst case, average case O(n log n)
end

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")

def fourth_anagram?(word1, word2) # O(3n) aka O(n)
    hash = Hash.new(0)

    word1.each_char { |char| hash[char] += 1 }
    word2.each_char { |char| hash[char] -= 1 }

    return hash.values.all?(&:zero?)
end
# p fourth_anagram?("gizmo", "sally")
# p fourth_anagram?("elvis", "lives")