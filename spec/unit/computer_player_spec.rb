require 'spec_helper'
describe TicTacToe::ComputerPlayer do
  

  describe '#get_next_move' do
    context 'empty_board' do
      let(:player1) { double("player1", :mark => "O") }
      let(:computer) {TicTacToe::ComputerPlayer.new(mark: "X")}
 
      
       it 'takes win if can take win' do
         board = TicTacToe::Board.new(board: "   OXXOXO")
         expect(computer.get_next_move(board, [computer, player1])).to eq 1
      end

    end
  end
end
