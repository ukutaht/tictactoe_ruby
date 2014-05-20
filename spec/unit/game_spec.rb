require 'spec_helper'

describe TicTacToe::Game do
  let(:board) { [[" ", "X", " "],
                 [" ", " ", " "],
                 ["O", " ", " "]] }
  let(:presenter) { double("presenter") }
  let(:player1) { double("player1", :mark => "X") }
  let(:player2) { double("player2", :mark => "O") }

  let(:game) { TicTacToe::Game.new(players: [player1, player2], board: board, presenter: presenter) }

  describe '#play_turn' do
    it 'updates presenter before and after the turn' do
      allow(player1).to receive(:get_next_move).and_return([0, 0])
      expect(presenter).to receive(:before_turn).with(game)
      expect(presenter).to receive(:after_turn).with(game)

      game.play_turn
    end

    it 'gets input from presenter' do
      allow(presenter).to receive(:before_turn)
      allow(presenter).to receive(:after_turn)
      expect(player1).to receive(:get_next_move).and_return([1, 2])

      game.play_turn
    end
  end
end
