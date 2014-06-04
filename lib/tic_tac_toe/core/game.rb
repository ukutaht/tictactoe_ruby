require_relative 'board'

module TicTacToe
  module Core
    class Game

      HumanPlayer = Struct.new(:mark) do
        def human?
          true
        end
      end

      attr_reader :board, :players

      def initialize(board=TicTacToe::Core::Board.new)
        @board = board
        @players = []
      end

      def make_move(index)
        return false if !valid_move?(index)

        board.move!(index, current_player.mark)
        players.rotate!
        play_computer_move
        true
      end

      def play_computer_move
        board.move!(get_computer_move, current_player.mark) unless over?
        players.rotate!
      end

      def human_goes_first
        add_human_player("X")
        add_computer_player("O")
      end

      def computer_goes_first
        add_computer_player("X")
        add_human_player("O")
        play_computer_move
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
        @board = TicTacToe::Core::Board.new
      end

      def board_string
        board.to_s
      end

      private

      def get_computer_move
        current_player.get_next_move(board, players)
      end

      def add_human_player(mark)
        players << HumanPlayer.new(mark) if need_players?
      end

      def add_computer_player(mark)
        players << TicTacToe::Core::ComputerPlayer.new(mark) if need_players?
      end
    end
  end
end
