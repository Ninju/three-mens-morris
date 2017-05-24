require "spec_helper"

RSpec.describe(Game) do
  subject(:game) { Game.new }

  it "alternates players" do
    game.place_token(1, 1)
    game.place_token(0, 0)

    expect(game.get_token_at(1, 1)).to eq(game.white_player_token)
    expect(game.get_token_at(0, 0)).to eq(game.black_player_token)
  end

  describe "winning" do
    it "knows a player has not won yet" do
      expect(game.winner).to be_nil
    end

    it "knows a player wins they fill a row" do
      game.place_token(0,0)
      game.place_token(1,0)
      game.place_token(0,1)
      game.place_token(2,0)

      game.place_token(0,2)

      expect(game.winner).to eq(game.white_player)
    end
  end

  it "only allows a player to place three tokens" do
    game.place_token(0,0)
    game.place_token(0,1)
    game.place_token(0,2)
    game.place_token(1,0)
    game.place_token(2,0)
    game.place_token(1,2)

    expect do
      # TODO: make sure that its raising the right error, because
      # could have already placed a token at 1,1 accidentally
      game.place_token(1,1)
    end.to raise_error
  end

  it "does not allow tokens to be placed out of the bounds of the game board" do
    expect { game.place_token(3, 1) }.to raise_error
  end

  it "does not allow a player to move tokens before they have placed all their tokens"
  it "does not allow a player to move token they don't own"
  it "does not allow players to place tokens in occupied spaces" do
    expect {
      game.place_token(1, 1)
      game.place_token(1, 1)
    }.to raise_error
  end
end
