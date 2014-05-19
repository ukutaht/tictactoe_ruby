require 'spec_helper'
class Dummy; end

describe TicTacToe::Rules do
  let(:board) {[["O", " ", " "],
                [" ", "X", " "],
                [" ", " ", " "]]}

  let(:diagonal_win_board) {[["O", " ", "X"],
                             [" ", "X", " "],
                             ["X", " ", " "]]}

  let(:horizontal_win_board) {[["O", "O", "O"],
                               [" ", "X", " "],
                               ["X", " ", " "]]}

  let(:vertical_win_board) { [["X", "O", "O"],
                              ["X", "X", " "],
                              ["X", " ", "O"]]}

  let(:game) { Dummy.new.extend(TicTacToe::Rules)}

  describe 'validations' do
    context 'valid move' do
      it 'returns true' do
        expect(game.valid_move?(x: 1, y: 0, board: board))
          .to be_true
      end
    end

    context 'invalid move' do
      it 'returns false' do
        expect(game.valid_move?(x: 0, y: 0, board: board))
          .to be_false
      end
    end
  end

  describe '.over?' do
    context 'game not over' do
      it 'is false' do
        expect(game.game_over?(board)).to be_false
      end
    end

    context 'diagonal win' do
      it 'is true' do
        expect(game.game_over?(diagonal_win_board)).to be_true
      end
    end

    context 'horizontal win' do
      it 'is true' do
        expect(game.game_over?(horizontal_win_board)).to be_true
      end
    end

    context 'vertical win' do
      it 'is true' do
        expect(game.game_over?(vertical_win_board)).to be_true
      end
    end
  end

  describe '.winner' do
    context 'we have a winner' do
      it 'returns the winners mark' do
        expect(game.winner(horizontal_win_board)).to eq "O"
      end
    end

    context 'no winner' do
      it 'returns no winner' do
        expect(game.winner(board)).to eq "No winner"
      end
    end
  end
end
