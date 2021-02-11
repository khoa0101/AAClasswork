require_relative "../piece.rb"
require_relative "../slideable.rb"

class Queen < Piece

  include Slideable

  attr_reader :symbol, :valid_moves

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = :Q
    @valid_moves = []
  end

  def move_dirs  
    axis_dirs.each do |dir|
      valid_moves.concat(grow_in_dir(dir))
    end
    diagonal_dirs.each do |dir|
      valid_moves.concat(grow_in_dir(dir))
    end
    valid_moves
  end

  def possible_moves
    self.move_dirs
  end

end