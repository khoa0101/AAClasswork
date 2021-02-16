
def phase_1_anagram?(str1, str2) # factorial
  perm = permutation(str1)
  return perm.include?(str2)
end

def permutation(str) 
  return [str] if str.length <= 1 
  first = str[0]
  perms = permutation(str[1..-1])
  perms.each_with_object([]) do |perm, result|
    (0...perm.length).each do |i|
      result << perm.dup.insert(i, first)
    end
  end
end

# p phase_1_anagram?("gizmo", "sally")    #=> false
# p phase_1_anagram?("elvis", "lives")    #=> true

def phase_2_anagram?(str1, str2) # quadratic (also could be n * m if str lengths are different)
  str1 = str1.split('')
  str2 = str2.split('')
  
  str1.each do |char|
    index = str2.find_index(char)
    if index.nil?
      return false
    else 
      str2.delete_at(index)
    end
  end
  return str2.empty?
end

# p phase_2_anagram?("gizmo", "sally")    #=> false
# p phase_2_anagram?("elvis", "lives")    #=> true

def phase_3_anagram?(str1, str2) # log linear
  str1 = str1.split('')
  str2 = str2.split('')

  str1.sort == str2.sort
end

# p phase_3_anagram?("gizmo", "sally")    #=> false
# p phase_3_anagram?("elvis", "lives")    #=> true

def phase_4_anagram?(str1, str2) # linear
  hash = Hash.new(0)
  str1.each_char { |char| hash[char] += 1 }
  str2.each_char { |char| hash[char] += 1 }
  
  hash.each do |k, v|
    return false if v % 2 == 1
  end
  true
end
p phase_4_anagram?("gizmo", "sally")    #=> false
p phase_4_anagram?("elvis", "lives")    #=> true