require_relative "../piece.rb"
require_relative "../slideable.rb"

class Bishop < Piece

    include Slideable

    attr_reader :symbol, :valid_moves
  
    def initialize(color, board, pos)
      super(color, board, pos)
      @symbol = :B
      @valid_moves = []
    end
  
    def move_dirs  
      diagonal_dirs.each do |dir|
        valid_moves.concat(grow_in_dir(dir))
      end  
      valid_moves
    end

    def possible_moves
      self.move_dirs
    end
end
  