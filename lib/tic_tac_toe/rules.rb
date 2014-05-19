module TicTacToe
  module Rules
    EMPTY = " "

    def valid_move?(x: nil, y: nil, board: nil)
      board[y][x] == EMPTY
    end

    def game_over?(board)
      diagonal_win?(board) || horizontal_win?(board) || vertical_win?(board)
    end

    def winner(board)
      if winning_row = find_winning_row(board)
        winning_row.first
      else
        "No winner"
      end
    end

    private

    def find_winning_row(board)
      [diagonals(board), board.transpose, board].flatten(1).find do |row|
        next if row.include?(" ")
        row.uniq.length == 1
      end
    end

    def diagonal_win?(board)
      diagonals(board).any?{|diagonal| winning_row?(diagonal)}
    end

    def horizontal_win?(board)
      board.any?{|row| winning_row?(row)}
    end

    def vertical_win?(board)
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