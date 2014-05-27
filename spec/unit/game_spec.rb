require 'spec_helper'

describe TicTacToe::Game do
  let(:board) { TicTacToe::Board.new( " X    O  ")}
  let(:presenter) { double("presenter").as_null_object }
  let(:player1) { double("player1", :mark => "X") }
  let(:player2) { double("player2", :mark => "O") }

  let(:game) { TicTacToe::Game.new(players: [player1, player2], board: board, presenter: presenter) }

  describe '#play_turn' do
    it 'displays board' do
      allow(player1).to receive(:get_next_move).and_return(0)
      expect(presenter).to receive(:display_board)
               
      game.play_turn
    end

    it 'gets input from player' do
      expect(player1).to receive(:get_next_move).and_return(5)

      game.play_turn
    end

    it 'prompts for input again if invalid' do
      expect(player1).to receive(:get_next_move).exactly(2).times.and_return(1, 8)  
      
      game.play_turn
    end

    it 'prompts for input more times if needed' do
      expect(player1).to receive(:get_next_move).exactly(4).times.and_return(1, 1, 1, 8)

      game.play_turn
    end

    it 'rotates players' do
      allow(player1).to receive(:get_next_move).and_return(0)
      game.play_turn

      expect(game.current_player).to eq player2
    end
  end

  describe '#current_player' do
    it 'returns the current player' do
      expect(game.current_player).to eq player1
    end
  end

  describe '#make_move!' do
    it 'delegates to board with current players mark' do
      expect(board).to receive(:move).with(1, "X")
      game.make_move!(1)
    end

    it 'updates its board' do
      starting_board = game.board
      game.make_move!(1)
      expect(game.board).to_not equal(starting_board)
    end
  end

  describe '#winnner' do
    it 'delegates to board' do
      expect(board).to receive(:winner)
      game.winner
    end
  end
end
