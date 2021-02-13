def windowed_max_range(arr, window_size) # quadratic
  range = 0
  max_range = 0
 (0...arr.length).each do |i|
    min = arr[i...i+window_size].min
    max = arr[i...i+window_size].max
    range = max - min
    max_range = range if range > max_range
    range = 0
 end
 return max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


class MyQueue
  def initialize
    @store = []
    
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def enqueue(value)
    @store << value
  end

  def dequeue
    @store.shift
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
    
  end

  def peek
    @store[-1 ]
  end

  def size
    @store.length
  end

  def push(value)
    @store << value
  end

  def pop
    @store.pop
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def peek
    @stack2.peek
  end

  def size
    @stack1.length
  end

  def enqueue(value)
    if @stack1.empty? && @stack2.empty? 
      @stack1.push(value) 
      @stack2.push(value)
    elsif
      ele = @stack2.pop
      @stack1.push(value)
      @stack2.push(value)
      @stack2.push(ele)

      # push into stack1
      # pop from stack2
    end
  end

  def dequeue
    @store.shift
  end

  def empty?
    @store.empty?
  end
end