require 'spec_helper'
describe TicTacToe::ComputerPlayer do
  

  describe '#get_next_move' do
    context 'empty_board' do
      let(:player1) { double("player1", :mark => "O") }
      let(:computer) {TicTacToe::ComputerPlayer.new("X")}
 
      
       it 'takes win if can take win' do
         board = TicTacToe::Board.new("   OXXOXO")
         expect(computer.get_next_move(board, [computer, player1])).to eq 1
      end

       it 'blocks opponents winning move' do
         board = TicTacToe::Board.new("X   O O  ")
         expect(computer.get_next_move(board, [computer, player1])).to eq 2
       end

       it 'forks if can fork' do
         board = TicTacToe::Board.new( "XO  X   O")
         forks = [3, 6]
         move = computer.get_next_move(board, [computer, player1])

         expect(forks).to include(move)
       end

       it 'forces opponent to defend when opponent can fork' do
         board = TicTacToe::Board.new("OX  O   X")
         good_moves = [2, 5, 6, 3]
         move = computer.get_next_move(board, [computer, player1])

         expect(good_moves).to include(move)
       end
    end
  end
end
