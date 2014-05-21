module TicTacToe
  class Board
    attr_reader :board

    def initialize(ary)
      @board = ary
    end
    EMPTY = " "

    def valid_move?(x: nil, y: nil)
      board[y][x] == EMPTY
    end

    def game_over?
      diagonal_win? || horizontal_win? || vertical_win?
    end

    def winner
      if winning_row = find_winning_row
        winning_row.first
      else
        "No winner"
      end
    end
    
    def move!(y: nil, x: nil, mark: nil)
      board[y][x] = mark
    end

    def size
      board.size
    end

    def to_s
      board.to_s
    end

    private

    def find_winning_row
      [diagonals(board), board.transpose, board].flatten(1).find do |row|
        next if row.include?(" ")
        row.uniq.length == 1
      end
    end

    def diagonal_win?
      diagonals(board).any?{|diagonal| winning_row?(diagonal)}
    end

    def horizontal_win?
      board.any?{|row| winning_row?(row)}
    end

    def vertical_win?
      board.transpose.any?{|row| winning_row?(row)}
    end

    def diagonals(ary)
      [diagonal(ary), diagonal(ary.transpose.map(&:reverse))]
    end

    def diagonal(ary)
      (0...ary.size).map do |n|
        ary[n][n]
      end
    end

    def winning_row?(row)
      return false if row.any?{|cell| cell == EMPTY}
      row.uniq.length == 1
    end

  end
end
