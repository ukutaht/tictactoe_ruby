require 'spec_helper'

describe TicTacToe::Game do
  let(:board) { TicTacToe::Board.new([[" ", "X", " "],
                                      [" ", " ", " "],
                                      ["O", " ", " "]]) }
  let(:presenter) { double("presenter").as_null_object }
  let(:player1) { double("player1", :mark => "X") }
  let(:player2) { double("player2", :mark => "O") }

  let(:game) { TicTacToe::Game.new(players: [player1, player2], board: board, presenter: presenter) }

  describe '#play_turn' do
    it 'updates presenter before and after the turn' do
      allow(player1).to receive(:get_next_move).and_return([0, 0])
      expect(presenter).to receive(:before_turn)
      expect(presenter).to receive(:after_turn)
               
      game.play_turn
    end

    it 'gets input from player' do
      expect(player1).to receive(:get_next_move).and_return([1, 2])

      game.play_turn
    end

    it 'prompts for input again if invalid' do
      expect(player1).to receive(:get_next_move).exactly(2).times.and_return([0, 1], [2, 2])  
      
      game.play_turn
    end

    it 'prompts for input more times if needed' do
      expect(player1).to receive(:get_next_move).exactly(4).times.and_return([0, 1], [0, 1],
                                                                             [0, 1], [2, 2])  

      game.play_turn
    end
  end

  describe '#board_size' do
    it 'delegates to board' do
      expect(board).to receive(:size)
      game.board_size
    end
  end
end
