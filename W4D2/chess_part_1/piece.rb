require 'singleton'

class Piece
  attr_reader :color, :name, :pos
  def initialize(color, name, pos)
    @color = color
    @name = name
    @pos = pos
  end

  def to_s
    return "#{color} #{name[0].upcase}"
  end

end

class NullPiece < Piece

  include Singleton

  def initialize
    super(nil, nil, pos)
  end

  def moves
    nil
  end

  def name
    nil
  end
end

# p n = NullPiece.instance
