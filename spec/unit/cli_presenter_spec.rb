require 'spec_helper'

describe TicTacToe::CLI_Presenter do
  let(:presenter) { TicTacToe::CLI_Presenter.new(io: StringIO.new) }
  before{ presenter.update_board(TicTacToe::Board.new)}

   describe '#before_turn' do
    it 'outputs generated string' do
      presenter.io = s = StringIO.new
      expect(s).to receive(:puts).exactly(3).times
      
      presenter.before_turn
    end
  end

  describe 'get_next_move' do
    it 'gets input from stdin' do
      presenter.io = s = StringIO.new("3")

      expect(presenter.get_next_move).to eq 3 
    end

    it 'handles newlines' do
      presenter.io = StringIO.new("5\n")

      expect(presenter.get_next_move).to eq 5
    end
  end
end
