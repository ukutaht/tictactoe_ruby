module TicTacToe
  class Board
    attr_reader :board

    STARTING_BOARD = "         "
    EMPTY = " "
    NO_WINNER_MSG = :no_winner

    def initialize(board: nil)
      @board = board || STARTING_BOARD
    end

    def valid_move?(i)
      board[i] == EMPTY
    end

    def valid_moves
      (0...board.size).select{|i| board[i] == EMPTY}
    end

    def game_over?
      draw? || winner != NO_WINNER_MSG
    end

    def winner
      if winning_row = find_winning_row
        winning_row.first
      else
        NO_WINNER_MSG
      end
    end

    def draw?
      board.chars.all?{|c| c != EMPTY} && winner == NO_WINNER_MSG
    end
    
    def move(index: nil, mark: nil)
      new_board_string = String.new(board)
      new_board_string[index] = mark
      Board.new(board: new_board_string)
    end

    def char_at(i)
      board[i]
    end

    def inspect 
      board.inspect
    end

    private

    def find_winning_row
      [diagonals, rows, columns].flatten(1).find do |row|
        next if row.include?(EMPTY)
        row.uniq.length == 1
      end
    end

    def rows
      board.chars.each_slice(side_length).to_a
    end

    def columns
      rows.transpose
    end

    def diagonals
      board_ary = board.split("").each_slice(size).to_a
      [diagonal(board_ary), diagonal(board_ary.transpose.map(&:reverse))]
    end

    def diagonal(ary)
      (0...size).map do |n|
        ary[n][n]
      end
    end

    def winning_row?(row)
      return false if row.any?{|cell| cell == EMPTY}
      row.uniq.length == 1
    end

    def side_length
      @side_length ||= Math.sqrt(board.size)
    end
  end
end
