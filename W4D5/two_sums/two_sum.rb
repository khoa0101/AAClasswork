def bad_two_sum?(arr, target) #quadratic
  arr.each_with_index do |num1, i|
    arr.each_with_index do |num2, j|
      return true if num1 + num2 == target && i < j
    end
  end
  false
end

def okay_two_sum?(arr, target) #nlogn
  arr = arr.sort
  (0...arr.length).each do |i|
    j = i + 1
    return true if j < arr.length && arr[i] + arr[j] == target 
  end
  false
end

def two_sum?(arr, target) #linear
  hash = Hash.new{}
  arr.each do  |ele| 
    compliment = target - ele
    return true if hash[compliment]
    hash[ele] = true
  end
  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false