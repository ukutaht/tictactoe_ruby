module TicTacToe
  class Board
    attr_reader :board

    STARTING_BOARD =  "         "
    EMPTY = " "
    WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                            [0, 3, 6], [1, 4, 7], [2, 5, 8],
                            [0, 4, 8], [2, 4, 6]]

    def initialize(board=STARTING_BOARD)
      @board = board.dup
    end

    def valid_move?(i)
      valid_moves.include?(i)
    end

    def valid_moves
      (0...board.size).select{|i| board[i] == EMPTY}
    end

    def game_over?
      draw? || winner
    end

    def winner
      winner = nil
      WINNING_COMBINATIONS.each do | triplet|
        winner = board[triplet.first] if winning_row?(triplet)
      end
      winner
    end

    def draw?
      valid_moves.empty? && !winner 
    end

    def move!(index, mark)
      @board[index] = mark
      self
    end
    
    def move(index, mark)
      Board.new(board.dup).move!(index, mark)
    end

    def char_at(i)
      board[i]
    end

    def to_s 
      board.chars.map.with_index{|cell, index| cell == EMPTY ? index + 1 : cell}.join("")
    end

    def empty?
      board.chars.all?{|char| char == EMPTY}
    end

    private

    def winning_row?(triplet)
      row = triplet.map{|i| board[i]}
      row.uniq.length == 1 && row[0] != EMPTY
    end
  end
end
