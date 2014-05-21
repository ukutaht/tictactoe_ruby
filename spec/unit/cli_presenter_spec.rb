require 'spec_helper'

describe TicTacToe::CLI_Presenter do
  let(:mid_game_board) {     [[" ", "O", "O"],
                              [" ", "X", " "],
                              ["X", " ", "O"]]}
  let(:game) { double(:board => mid_game_board, :current_player_mark => "X", :board_size => 3) }
  let(:presenter) { TicTacToe::CLI_Presenter.new(game: game, io_in: StringIO.new, io_out: StringIO.new) }

  describe '#before_turn_string' do
    it 'includes the board' do
      expect(presenter.before_turn_string).to match(mid_game_board.to_s) 
    end
  end

  describe '#after_turn_string' do
    it 'includes the board' do
      expect(presenter.after_turn_string).to match(mid_game_board.to_s) 
    end
  end

  describe '#before_turn' do
    it 'outputs generated string' do
      presenter.io_out = s = StringIO.new
      expect(s).to receive(:puts)
      
      presenter.before_turn
    end
  end
  describe '#after_turn' do
    it 'outputs generated string' do
      presenter.io_out = s = StringIO.new
      expect(s).to receive(:puts)

      presenter.after_turn
    end
  end

  describe 'get_next_move' do
    it 'gets input from stdin' do
      presenter.io_in = s = StringIO.new("3")
      
      expect(presenter.get_next_move).to eq [0, 2]
    end

    it 'handles newlines' do
      presenter.io_in = StringIO.new("5\n")

      expect(presenter.get_next_move).to eq [1, 1]
    end
  end
end
