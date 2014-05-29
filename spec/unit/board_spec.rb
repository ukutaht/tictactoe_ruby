require 'spec_helper'

describe TicTacToe::Board do
  let(:mid_game_str) { "O   X    " }
  let(:diagonal_win_str) {"O X X X  "}
  let(:horizontal_win_str) {"OOO X X  "}
  let(:vertical_win_str) {"XOOXX X O"}
  let(:draw_board_str) {"XOXXXOOXO"}
  
  let(:mid_game_board) { TicTacToe::Board.new(mid_game_str) }
  let(:diagonal_win_board) { TicTacToe::Board.new(diagonal_win_str) }
  let(:horizontal_win_board) { TicTacToe::Board.new(horizontal_win_str) }
  let(:vertical_win_board) { TicTacToe::Board.new(vertical_win_str) }
  let(:draw_board) { TicTacToe::Board.new(draw_board_str) }
  

  describe '#valid_move?' do
    it 'returns true for valid move' do
      expect(mid_game_board.valid_move?(1))
        .to be_true
    end

    it 'returns false if cell already occupied' do
      expect(mid_game_board.valid_move?(0))
        .to be_false
    end

    it 'returns false if out of range' do
      expect(mid_game_board.valid_move?(-1))
        .to be_false
    end
  end

  describe '#valid_moves' do
    it 'returns all valid moves' do
      expect(mid_game_board.valid_moves).to eq [1, 2, 3, 5, 6, 7, 8]
    end

     it 'returns empty list for full board' do
       expect(draw_board.valid_moves).to eq []
     end
  end

  describe '#over?' do
    context 'game not over' do
      it 'is false' do
        expect(mid_game_board.game_over?).to be_false
      end
    end

    context 'diagonal win' do
      it 'is true' do
        expect(diagonal_win_board.game_over?).to be_true
      end
    end

    context 'horizontal win' do
      it 'is true' do
        expect(horizontal_win_board.game_over?).to be_true
      end
    end

    context 'vertical win' do
      it 'is true' do
        expect(vertical_win_board.game_over?).to be_true
      end
    end
    context 'draw' do
      it 'is true' do
        expect(draw_board.game_over?).to eq true
      end
    end
  end

  describe '.winner' do
    context 'we have a winner' do
      it 'returns the winners mark' do
        expect(horizontal_win_board.winner).to eq "O"
      end
    end

    context 'no winner' do
      it 'returns no winner' do
        expect(mid_game_board.winner).to eq :no_winner
      end
    end
  end

  describe '#move' do
    it 'returns new board' do
      expect(mid_game_board.move(8, "X")).to_not equal(mid_game_board)
    end

    it 'places the mark' do
      expect(mid_game_board.move(8, "X").char_at(8)).to eq "X"
    end
  end

  describe '#move!' do
    it 'places the mark' do
      expect(mid_game_board.move!(8, "X").char_at(8)).to eq "X"
    end
  end

  describe '#empty?' do
    it 'is true for empty board' do
      expect(TicTacToe::Board.new.empty?).to be_true
    end

    it 'is false for non-empty board' do
      expect(mid_game_board.empty?).to be_false
    end
  end
end
