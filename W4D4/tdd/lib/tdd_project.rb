class Array

  def my_uniq
    hash = Hash.new(0)
    self.each { |ele| hash[ele] += 1 }
    hash.keys
  end

  def two_sum
    pairs = []
    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        pairs << [i, j] if self[i] + self[j] == 0
        j += 1
      end
      i += 1
    end
    return pairs
  end
end

def transpose(array)
  transposed = Array.new(array[0].length) { Array.new(array.length) }
  i = 0
  while i < array.length
    j = 0
    while j < array.length
      transposed[i][j] = array[j][i] 
      j += 1
    end
    i += 1
  end
  return transposed
end

def stock_picker(days)
  price = []
  max = 0
  (0...days.length).each do |i|
    (i+1...days.length).each do |j|
      if days[j] - days[i] > 0 && days[j] - days[i] > max
        price = [i, j]
        max = days[j] - days[i]
      end
    end
  end
  price
end

class TowersOfHanoi
  attr_accessor :rods

  def initialize
    @rods = Array.new(3) { Array.new }
    @rods[0] = [3,2,1]
  end

  def prompt
    unless won?
      puts "Please enter the rod you want to move from"
      from = gets.chomp
      puts "Please enter the rod you want to move to"
      to = gets.chomp
      move(from, to)
    end
  end

  def move(from, to)
    raise "Can't move from empty rod" if rods[from].empty?
    raise "Can't put larger disc on this rod" if !rods[to].empty? && rods[from].last > rods[to].last 
    rods[to] << rods[from].pop
  end

  def won?
    return @rods[2] == [3,2,1]
  end
end