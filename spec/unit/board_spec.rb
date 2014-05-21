require 'spec_helper'

describe TicTacToe::Board do
  let(:mid_game_ary) {[["O", " ", " "],
                       [" ", "X", " "],
                       [" ", " ", " "]]}

  let(:diagonal_win_ary) {[["O", " ", "X"],
                             [" ", "X", " "],
                             ["X", " ", " "]]}

  let(:horizontal_win_ary) {[["O", "O", "O"],
                               [" ", "X", " "],
                               ["X", " ", " "]]}

  let(:vertical_win_ary) { [["X", "O", "O"],
                              ["X", "X", " "],
                              ["X", " ", "O"]]}

  let(:mid_game_board) { TicTacToe::Board.new(mid_game_ary) }
  let(:diagonal_win_board) { TicTacToe::Board.new(diagonal_win_ary) }
  let(:horizontal_win_board) { TicTacToe::Board.new(horizontal_win_ary) }
  let(:vertical_win_board) { TicTacToe::Board.new(vertical_win_ary) }
  

  describe 'validations' do
    context 'valid move' do
      it 'returns true' do
        expect(mid_game_board.valid_move?(x: 1, y: 0))
          .to be_true
      end
    end

    context 'invalid move' do
      it 'returns false' do
        expect(mid_game_board.valid_move?(x: 0, y: 0))
          .to be_false
      end
    end
  end

  describe '.over?' do
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
  end

  describe '.winner' do
    context 'we have a winner' do
      it 'returns the winners mark' do
        expect(horizontal_win_board.winner).to eq "O"
      end
    end

    context 'no winner' do
      it 'returns no winner' do
        expect(mid_game_board.winner).to eq "No winner"
      end
    end
  end

  describe '#move!' do
    context 'move is valid' do
      it 'marks the spot' do
        mid_game_board.move!(y: 2, x: 2, mark: "X")
        expect(mid_game_board.board[2][2]).to eq "X"
      end
    end
  end

  describe '#size' do
    it 'returns the correct size' do
      expect(mid_game_board.size).to eq mid_game_board.board.size
    end
  end
end
