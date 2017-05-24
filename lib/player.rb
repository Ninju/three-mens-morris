class Player
  def initialize(token_id:)
    @tokens = [token_id, token_id, token_id]
  end

  def has_tokens?
    !tokens.empty?
  end

  def take_token!
    tokens.pop
  end

  private

  attr_reader :tokens
end
