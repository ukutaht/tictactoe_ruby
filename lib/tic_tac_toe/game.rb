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
      self.players = presenter.get_players
      presenter.update_current_player(current_player)
      until board.game_over?
        play_turn
      end
      presenter.announce_winner(board.winner)
    end

    def play_turn
      presenter.display_board
      make_move!(get_move)
      presenter.update_board(board)
    end

    def make_move!(index)
     @board = board.move(index, current_player.mark) 
     rotate_players!
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
