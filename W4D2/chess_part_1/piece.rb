class Piece
  attr_reader :color, :name, :pos
  def initialize(color, name, pos)
    @color = color
    @name = name
    @pos = pos
  end

  def inspect
    "#{@color} #{@name}".inspect
  end

end