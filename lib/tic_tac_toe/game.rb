module TicTacToe
  class Game
    attr_accessor :board, :players, :presenter

    def initialize(players: nil, board: nil, presenter: nil)
      @players = players
      @board = board
      @presenter = presenter
    end

    def play
      get_players
      until board.game_over?
        play_turn
      end
      presenter.announce_winner(board.winner)
    end

    def play_turn
      presenter.display_board(board)
      board.move!(get_move, current_player.mark) 
      players.rotate!
    end

    def current_player
      players.first
    end

    private

    def get_players
      @players = []
      presenter.get_player_types.each do |mark, type|
        if type == :human
          @players << TicTacToe::HumanPlayer.new(mark: mark, presenter: presenter)
        elsif type == :computer
          @players << TicTacToe::ComputerPlayer.new(mark: mark)
        end
      end
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
