module TicTacToe
  class Board
    attr_reader :board

    STARTING_BOARD = "         "
    EMPTY = " "
    NO_WINNER_MSG = :no_winner
    WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                            [0, 3, 6], [1, 4, 7], [2, 5, 8],
                            [0, 4, 8], [2, 4, 6]]

    def initialize(board=nil)
      @board = board || STARTING_BOARD
    end

    def valid_move?(i)
      valid_moves.include?(i)
    end

    def valid_moves
      (0...board.size).select{|i| board[i] == EMPTY}
    end

    def game_over?
      draw? || winner != NO_WINNER_MSG
    end

    def winner
      find_winner || NO_WINNER_MSG
    end

    def draw?
      board.chars.all?{|c| c != EMPTY} && winner == NO_WINNER_MSG
    end

    def move!(index, mark)
      @board[index] = mark
      self
    end
    
    def move(index, mark)
      new_board_string = String.new(board)
      Board.new(new_board_string).move!(index, mark)
    end

    def char_at(i)
      board[i]
    end

    def rotations
      ROTATIONS.map do |rotation|
        rotation.map {|i| board[i]}.join
      end
    end

    def to_s 
      board.chars.map.with_index{|cell, index| cell == EMPTY ? index + 1 : cell}.join("")
    end

    def to_sym
      board.to_sym
    end
    
    def empty?
      board.chars.all?{|char| char == EMPTY}
    end

    private

    def find_winner
      WINNING_COMBINATIONS.each do |triplet|
        return board[triplet[0]] if winning_row?(triplet)
      end
      nil
    end

    def winning_row?(triplet)
      row = triplet.map{|i| board[i]}
      row.uniq.length == 1 && row[0] != EMPTY
    end

    def side_length
      @side_length ||= Math.sqrt(board.size)
    end
  end
end
