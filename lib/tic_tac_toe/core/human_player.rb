module TicTacToe
  module Core
    class HumanPlayer
      attr_reader :mark

      def initialize(mark)
        @mark = mark
      end

      def human?
        true
      end

      def make_move(board, index)
        return false if !board.valid_move?(index)

        board.move!(index, mark)
      end
    end
  end
end

