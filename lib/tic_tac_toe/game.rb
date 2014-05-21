module TicTacToe
  class Game
    attr_reader :board, :players, :presenter

    def initialize(players: nil, board: nil, presenter: nil)
      @players = players
      @board = board
      @presenter = presenter
    end

    def play
      until board.game_over?
        play_turn
        players.rotate!
      end
      presenter.announce_winner(board.winner)
    end

    def play_turn
      presenter.before_turn(self)
      y, x = current_player.get_next_move
      if board.valid_move?(x: x, y: y)
        board.move!(x: x, y: y, mark: current_player.mark)
      end
      presenter.after_turn(self)
    end

    def board_size
      @board_size ||= board.size
    end

    private

    def current_player
      players.first
    end
  end
end
