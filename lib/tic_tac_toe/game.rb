require_relative 'board'
module TicTacToe
  class Game
    HumanPlayer = Struct.new(:mark) do
      def human?
        true
      end
    end

    attr_reader :board, :players

    def initialize(board=TicTacToe::Board.new)
      @board = board
      @players = []
    end

    def make_move(index)
      board.move!(index, current_player.mark)
      players.rotate!
    end

    def play_until_input_needed
      until current_player.human? || over?
        make_move(get_computer_move)
      end
    end

    def human_goes_first
      add_human_player("X")
      add_computer_player("O")
    end

    def computer_goes_first
      add_computer_player("X")
      add_human_player("O")
      play_until_input_needed
    end

    def add_human_player(mark)
      players << HumanPlayer.new(mark) if need_players?
    end

    def add_computer_player(mark)
      players << TicTacToe::ComputerPlayer.new(mark) if need_players?
    end

    def current_player
      players.first
    end

    def need_players?
      players.size < 2
    end

    def over?
      board.game_over?
    end

    def winner
      board.winner
    end

    def valid_move?(index)
      board.valid_move?(index)
    end

    def reset!
      @players = []
      @board = TicTacToe::Board.new
    end

    private

    def get_computer_move
      current_player.get_next_move(board, players)
    end
  end
end
