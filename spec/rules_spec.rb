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

  describe 'moving' do
    context 'valid move' do
      it 'executes the move' do
        expect(game.move!(x: 1, y: 0, mark: "X", board: board))
          .to eq [["O", "X", " "],
                  [" ", "X", " "],
                  [" ", " ", " "]]
      end
    end

    context 'invalid move' do
      it 'does not allow move' do
        expect{game.move!(x: 0, y: 0, mark: "X", board: board)}
          .to raise_error
      end
    end

    describe 'validations' do
      context 'valid move' do
        it 'returns true' do
          expect(game.valid?(x: 1, y: 0, board: board))
            .to be_true
        end
      end

      context 'invalid move' do
        it 'returns false' do
          expect(game.valid?(x: 0, y: 0, board: board))
            .to be_false
        end
      end
    end

    describe '.over?' do
      context 'game not over' do
        it 'is false' do
          expect(game.over?(board)).to be_false
        end
      end

      context 'diagonal win' do
        it 'is true' do
          expect(game.over?(diagonal_win_board)).to be_true
        end
      end

      context 'horizontal win' do
        it 'is true' do
          expect(game.over?(horizontal_win_board)).to be_true
        end
      end

      context 'vertical win' do
        it 'is true' do
          expect(game.over?(vertical_win_board)).to be_true
        end
      end
    end
  end
end