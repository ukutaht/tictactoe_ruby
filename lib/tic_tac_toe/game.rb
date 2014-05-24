module TicTacToe
  class Game
    attr_accessor :board, :players, :presenter

    def initialize(players: nil, board: nil, presenter: nil)
      @players = players
      @board = board
      @presenter = presenter
      presenter.update_board(board)
    end

    def play
      until board.game_over?
        play_turn
      end
      presenter.announce_winner(board.winner)
    end

    def play_turn
      presenter.before_turn
      make_move!(get_move)
      presenter.update_board(board)
    end

    def add_player(player)
      @players << player
    end

    def valid_moves
      board.valid_moves
    end

    def make_move!(index)
     @board = board.move(index: index, mark: current_player.mark) 
     rotate_players!
    end

    def winner
      board.winner
    end

    def current_player
      players.first
    end

    private

    def rotate_players!
      players.rotate!
      presenter.update_current_player(current_player)
    end

    def get_move
      i  = current_player.get_next_move(board, players)
      until board.valid_move?(i)
        presenter.invalid_move_message
        i = current_player.get_next_move
      end
      i 
    end

  end
end
