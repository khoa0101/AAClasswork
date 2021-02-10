require_relative "piece.rb"

class Board
  attr_reader :grid

  @@INITIATIAL_POS = {
    "rook" => [[0, 0], [0, 7], [7, 0], [7, 7]],
    "knight" => [[0, 1], [0, 6], [7, 1], [7, 6]],
    "bishop" => [[0, 2],[0, 5], [7, 2], [7, 5]],
    "queen" => [[0, 3], [7, 3]],
    "king" => [[0, 4], [7, 4]],
    "pawn" => [
      [1, 0], [1, 1],
      [1, 2], [1, 3],
      [1, 4], [1, 5],
      [1, 6], [1, 7],
      [6, 0], [6, 1],
      [6, 2], [6, 3],
      [6, 4], [6, 5],
      [6, 6], [6, 7]
    ]
  }

  def self.build_board
    Array.new(8) { Array.new(8) }
  end

  def [](pos)
    grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    grid[pos[0]][pos[1]] = val
  end

  def initialize
    @grid = Board.build_board

    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        @@INITIATIAL_POS.each do |k, v|
          if v.include?(pos)
            grid[row][col] = (row < 2 ? Piece.new(:W, k, pos) : Piece.new(:B, k, pos))
            break
          else
            grid[row][col] = NullPiece.instance
          end
        end
      end
    end

  end

  def print
    grid.each do |row|
      row_pieces = []
      row.each do |piece|
        if !piece.name.nil?
          row_pieces << piece.to_s
        else
          row_pieces << "   "
        end
      end
      p row_pieces
    end
  end

  def move_piece(start_pos, end_pos)
    start_pos = self[start_pos]
    end_pos = self[end_pos]
    if start_pos.name.nil? 
      raise ArgumentError.new("there is no piece at the starting position")
    end
    if end_pos.nil?
      start_pos, end_pos = end_pos, start_pos
    else
      if start_pos.color == end_pos.color
        raise ArgumentError.new("occupied position at ending postion")
      else
        end_pos = start_pos
        start_pos = Piece.new(nil, nil, start_pos)
      end
    end
  end

  def valid_pos(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def find_king(color)
    (0...8).each do |row|
      (0...8).each do |col|
        return [row, col] if grid[row][col].color == color && grid[row][col].name == "king"
      end
    end
    nil
  end

  def checkmate
    
  end

end

board = Board.new
board.print
# p "-" * 60
# board.move_piece([0,0], [5,0])
# board.print
# p "-" * 60
# board.move_piece([4,1], [4,2])
# board.print
# board.move_piece([7,5], [7,4])
# board.print
# p "-" * 60
# board.move_piece([6,2], [1,2])
# board.print