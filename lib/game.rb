class Game
  attr_reader :white_player, :black_player
  attr_reader :winner

  def initialize
    @board = Board.new
    @white_player = Player.new(token_id: white_player_token)
    @black_player = Player.new(token_id: black_player_token)
    @turn = [@white_player, @black_player]
  end

  def white_player_token
    :white
  end

  def black_player_token
    :black
  end

  def get_token_at(col, row)
    board.get(col, row)
  end

  def place_token(col, row)
    unless current_player.has_tokens?
      raise "You must have tokens"
    end

    unless @board.is_empty_at?(col, row)
      raise "Place is already taken"
    end

    taken_token = current_player.take_token!

    board.put(col, row, taken_token)

    switch_turns!

    check_win
  end

  def move_token(from_col, from_row, to_col, to_row)
    if from_col == to_col && from_row == to_row
      raise "Can not move a token to the same place"
    end

    if current_player.has_tokens?
      raise "You have tokens so can't move other tokens"
    end

    from_token = board.get(from_col, from_row)

    unless current_player.owns?(from_token)
      raise "That's not your token, please put it down."
    end

    unless board.is_empty_at?(to_col, to_row)
      raise "There is already a token at that destination"
    end

    taken_token = board.take(from_col, from_row)

    board.put(to_col, to_row, taken_token)

    check_win

    switch_turns!
  end

  private

  attr_reader :board

  def current_player
    @turn.first
  end

  def check_win
    binding.pry
    if board.get(0, 0) == board.get(0, 1) && board.get(0, 1) == board.get(0, 2)
      @winner = board.get(0, 0)
    end
  end

  def switch_turns!
    @turn.reverse!
  end
end
