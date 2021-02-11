require_relative "../piece.rb"

require 'singleton'

class NullPiece < Piece

  include Singleton

  def initialize
    super(nil, nil, ["this is the null postiion"])
  end

  def possible_moves
    []
  end

  def symbol
    "  "
  end
end