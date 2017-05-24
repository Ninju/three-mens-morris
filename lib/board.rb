class Board
  def initialize
    @board = [
      [empty_cell, empty_cell, empty_cell],
      [empty_cell, empty_cell, empty_cell],
      [empty_cell, empty_cell, empty_cell],
    ]
  end

  def get(col, row)
    board[row][col]
  end

  def put(col, row, value)
    width = 3
    height = 3

    if row + 1 > width || row < 0 || col + 1 > height || col < 0
      raise "Out of bounds error, cannot place anything at (#{col}, #{row})"
    end

    board[row][col] = value
  end

  def take(col, row)
    occupier = get(col, row)
    put(col, row, empty_cell)
    occupier
  end

  def is_empty_at?(col, row)
    get(col, row) === empty_cell
  end

  private

  attr_reader :board

  def empty_cell
    nil
  end
end
