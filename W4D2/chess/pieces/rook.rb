require_relative "../piece.rb"
require_relative "../slideable.rb"


class Rook < Piece

  include Slideable

  attr_reader :symbol, :valid_moves

  def initialize(color, board, pos)
    super(color, board, pos)
    @symbol = :R
    @valid_moves = []
  end

  def move_dirs  
    axis_dirs.each do |dir|
      valid_moves.concat(grow_in_dir(dir))
    end  
    valid_moves
  end

  def possible_moves
    self.move_dirs
  end

end