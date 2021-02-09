require_relative "piece.rb"

class Board

  @@INITIATIAL_POS = {
    "rook" => [[0, 0], [0, 7], [7, 7], [7, 7]],
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

  def initialize
    @board = Board.build_board

    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        @@INITIATIAL_POS.each do |k, v|
          @board[row][col] = (v.include?(pos) ? Piece.new(k, pos) : Piece.new(nil, pos))
        end
      end
    end

  end

  def print
    @board.each do |row|
      row_pieces = []
      row.each do |piece|
        row_pieces << piece
      end
      p row_pieces
    end
  end

  def move_piece(start_pos, end_pos)
  end
end

board = Board.new
board.print