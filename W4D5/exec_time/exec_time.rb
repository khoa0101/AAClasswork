def my_min(array)
  min = array[0]
  array.each do |ele|
    min = ele if ele < min
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def largest_contiguous_subsum(array)
  largest_sum = array[0]
  current_sum = array[0]

  (1...array.length).each do |i|
    current_sum = 0 if current_sum < 0
    current_sum += array[i]
    largest_sum = current_sum if current_sum > largest_sum
  end

  largest_sum
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1