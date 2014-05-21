require 'spec_helper'

describe TicTacToe::CLI_Presenter do
  let(:presenter) { TicTacToe::CLI_Presenter.new(io: StringIO.new) }

   describe '#before_turn' do
    it 'outputs generated string' do
      presenter.io = s = StringIO.new
      expect(s).to receive(:puts)
      
      presenter.before_turn
    end
  end
  describe '#after_turn' do
    it 'outputs generated string' do
      presenter.io = s = StringIO.new
      expect(s).to receive(:puts)

      presenter.after_turn
    end
  end

  describe 'get_next_move' do
    let(:board) {  [[" ", "O", "O"],
                    [" ", "X", " "],
                    ["X", " ", "O"]]}
    it 'gets input from stdin' do
      presenter.io = s = StringIO.new("3")
      presenter.update_board(board) 

      expect(presenter.get_next_move).to eq [0, 2]
    end

    it 'handles newlines' do
      presenter.io = StringIO.new("5\n")
      presenter.update_board(board) 

      expect(presenter.get_next_move).to eq [1, 1]
    end
  end
end
