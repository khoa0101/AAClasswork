module Stepable

  def moves_diff
    moves = []
  end

  private
  def moves(dir)
    moves_in_dir = []
    step = [self.pos[0] + dir[0], self.pos[1] + dir[1]]
    moves_in_dir << step if self.valid_pos?(step)
    moves_in_dir
  end

end