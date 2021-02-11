class Piece
  attr_reader :color, :board, :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    " #{color}#{symbol} "
  end

  def empty?
    self == NullPiece.instance
  end

  def symbol
    symbol
  end

  def pos=(value)
    pos = value
    self.valid_moves = []
  end

  def move_into_check(end_pos)
    puts "hello, this function is still under construction"
  end

  def valid_pos?(pos)
    return false unless pos[0].between?(0,7) && pos[1].between?(0,7)
    return false if board[pos].color == self.color
    true
  end

  def possible_moves
    []
  end

end

