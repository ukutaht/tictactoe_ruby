module TicTacToe
  module Core
    class Board
      attr_reader :board_string

      STARTING_BOARD =  "         "
      EMPTY = " "
      WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                              [0, 3, 6], [1, 4, 7], [2, 5, 8],
                              [0, 4, 8], [2, 4, 6]]

      def initialize(board_string=STARTING_BOARD)
        @board_string = board_string.dup
      end

      def valid_move?(i)
        valid_moves.include?(i)
      end

      def valid_moves
        (0...board_string.size).select{|i| board_string[i] == EMPTY}
      end

      def game_over?
        draw? || winner
      end

      def winner
        winner = nil
        WINNING_COMBINATIONS.each do | triplet|
          winner = board_string[triplet.first] if winning_row?(triplet)
        end
        winner
      end

      def draw?
        valid_moves.empty? && !winner 
      end

      def move!(index, mark)
        @board_string[index] = mark
        self
      end
      
      def move(index, mark)
        Board.new(board_string.dup).move!(index, mark)
      end

      def char_at(i)
        board_string[i]
      end

      def to_s 
        board_string
      end

      def empty?
        board_string.chars.all?{|char| char == EMPTY}
      end

      def empty_square
        EMPTY
      end

      private

      def winning_row?(triplet)
        row = triplet.map{|i| board_string[i]}
        row.uniq.length == 1 && row[0] != EMPTY
      end
    end
  end
end
