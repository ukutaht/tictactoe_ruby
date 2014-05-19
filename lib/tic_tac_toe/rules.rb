module TicTacToe
  module Rules
    EMPTY = " "
    def move!(x: nil, y: nil, mark: nil, board: nil)
      raise "Cell already occupied" unless valid?(x: x, y: y, board: board)
      board[y][x] = mark
      board
    end

    def valid?(x: nil, y: nil, board: nil)
      board[y][x] == EMPTY
    end

    def over?(board)
      diagonal_win?(board) || horizontal_win?(board) || vertical_win?(board)
    end

    private

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