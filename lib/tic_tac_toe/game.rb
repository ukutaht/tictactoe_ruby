module TicTacToe
  class Game
    include TicTacToe::Rules
    attr_reader :board, :players, :presenter

    def initialize(players: nil, board: nil, presenter: nil)
      @players = players
      @board = board
      @presenter = presenter
    end

    def play
      until game_over?(board)
        play_turn
        players.rotate!
      end
      presenter.announce_winner(winner(board))
    end

    def play_turn
      presenter.before_turn(self)
      y, x = current_player.get_next_move
      if valid_move?(x: x, y: y, board: board)
        move!(x: x, y: y, mark: current_player.mark)
      end
      presenter.after_turn(self)
    end

    private

    def current_player
      players.first
    end

    def move!(x: nil, y: nil, mark: nil)
      board[y][x] = mark
    end
  end
end
