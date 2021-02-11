require_relative "../piece.rb"
require_relative "../stepable.rb"

class Knight < Piece
  attr_reader :symbol, :valid_moves
  include Stepable

  @@DIRECTIONS = [[1,2], [-1,2], [1,-2], [-1,-2], [2,1], [-2,1], [2,-1], [-2,-1]]

  def initialize(color, board, pos)
    super
    @symbol = :N
    @valid_moves = []
  end

  def moves_diff
    @@DIRECTIONS.each { |dir| valid_moves.concat(moves(dir)) }
    valid_moves
  end

  def possible_moves
    self.moves_diff
  end
end