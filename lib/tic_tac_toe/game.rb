module TicTacToe
  class Game
    attr_reader :board, :players, :presenter

    def initialize(players: nil, board: nil, presenter: nil)
      @players = players
      @board = board
      @presenter = presenter
      presenter.update_board(board)
    end

    def play
      until board.game_over?
        play_turn
        rotate_players
      end
      presenter.announce_winner(board.winner)
    end

    def play_turn
      presenter.before_turn
      y, x = get_move
      board.move!(x: x, y: y, mark: current_player.mark)
      presenter.update_board(board)
      presenter.after_turn
    end

    def board_size
      @board_size ||= board.size
    end

    private

    def rotate_players
      players.rotate!
      presenter.update_current_player(current_player)
    end

    def get_move
      y, x = current_player.get_next_move
      until board.valid_move?(x: x, y: y)
        presenter.invalid_move_message
        y, x = current_player.get_next_move
      end
      [y, x]
    end

    def current_player
      players.first
    end
  end
end
