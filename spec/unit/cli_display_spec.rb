require 'spec_helper'

describe TicTacToe::CLIDisplay do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::CLIDisplay.new(input, output) }

  describe '#get_next_move' do
    it 'gets input from stdin' do
      input.string = "3"
      expect(display.get_next_move).to eq 2 
    end

    it 'handles newlines' do
      input.string = "5\n"
      expect(display.get_next_move).to eq 4
    end
  end
end
