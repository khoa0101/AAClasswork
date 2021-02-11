require_relative "cursor.rb"
require_relative "board.rb"
require "colorize"

require 'byebug'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end


  def colors_for(i, j)
    # debugger
    if [i, j] == @cursor.cursor_pos
      bg = :yellow
    elsif (i + j).odd?
      bg = :black
    else
      bg = :white
    end
    { background: bg, color: :light_blue}
  end

  def render
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm"
    build_grid.each { |row| puts row.join }
  end

  def run
    until false
      self.render
      @cursor.get_input
    end
  end

end

board = Board.new
display = Display.new(board)
display.run
