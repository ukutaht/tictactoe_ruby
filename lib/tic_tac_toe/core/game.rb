require_relative 'board'
require_relative 'computer_player'

module TicTacToe
  module Core
    class Game

      HumanPlayer = Struct.new(:mark) do
        def human?
          true
        end

        def make_move(board, index)
          return false if !board.valid_move?(index)

          board.move!(index, mark)
        end
      end

      attr_reader :board, :players

      def initialize(board=TicTacToe::Core::Board.new)
        @board = board
        @players = []
      end

      def play_next_move(board_index=nil)
        if current_player.make_move(board, board_index)
          players.rotate!
        end
      end

      def human_goes_first
        add_human_player("X")
        add_computer_player("O")
      end

      def computer_goes_first
        add_computer_player("X")
        add_human_player("O")
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

      def reset!
        @players = []
        @board = TicTacToe::Core::Board.new
      end

      def board_string
        board.to_s
      end

      private

      def valid_move?(index)
        board.valid_move?(index)
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
