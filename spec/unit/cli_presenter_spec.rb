require 'spec_helper'

describe TicTacToe::CLI_Presenter do
  let(:presenter) { TicTacToe::CLI_Presenter.new(io: StringIO.new) }
  before{ presenter.update_board(TicTacToe::Board.new)}

   describe '#display_board' do
    it 'outputs generated string' do
      presenter.io = s = StringIO.new
      expect(s).to receive(:puts).exactly(5).times
      presenter.update_current_player(double(:mark => "X"))
      
      presenter.display_board
    end
  end
  
  describe '#get_player_types' do
    it 'returns appropriate player types' do
      presenter.io = s =StringIO.new("1\n2\n")
      s.stub(:puts)
      players = presenter.get_player_types
    
      expect(players["X"]).to be :human
      expect(players["O"]).to be :computer
    end
  end

  describe '#get_next_move' do
    it 'gets input from stdin' do
      presenter.io = StringIO.new("3")

      expect(presenter.get_next_move).to eq 2 
    end

    it 'handles newlines' do
      presenter.io = StringIO.new("5\n")

      expect(presenter.get_next_move).to eq 4
    end
  end
end
