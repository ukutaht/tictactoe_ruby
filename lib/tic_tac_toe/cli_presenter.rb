module TicTacToe
  class CLI_Presenter
    attr_reader :board, :current_player
    attr_accessor :io

    def initialize(io: io)
      @io = io
    end

    def update_board(board)
      @board = board
    end
    
    def update_current_player(player)
      @current_player = player
    end

    def before_turn
      io.puts board.to_s
    end

    def after_turn
      io.puts board.to_s
    end

    def invalid_move_message
      io.puts "Invalid move, try again."
    end



    def announce_winner(winner)
      io.puts "#{winner} has won!"
    end

    def get_next_move
      sanitize_input(io.gets.chomp)
    end

    private

    def sanitize_input(str)
      (str.to_i - 1).divmod(board.size)
    end
  end
end
