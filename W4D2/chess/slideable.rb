module Slideable
  
  AXIS_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def axis_dirs
    AXIS_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private
  def move_dirs
    moves = []
  end

  private
  def grow_in_dir(dir)
    moves_in_dir = []
    next_step = [self.pos[0] + dir[0], self.pos[1] + dir[1]]
    until !self.valid_pos?(next_step)
      moves_in_dir << next_step
      break if !self.board[next_step].empty?
      next_step = [next_step[0] + dir[0], next_step[1] + dir[1]]
    end
    moves_in_dir
  end

end