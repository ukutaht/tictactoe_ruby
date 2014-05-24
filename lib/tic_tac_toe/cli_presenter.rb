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
      system('clear')
      board.board.chars.each_slice(3).to_a.each do |row|
        io.puts row.inspect
      end
    end

    def invalid_move_message
      io.puts "Invalid move, try again."
    end



    def announce_winner(winner)
      io.puts "#{winner} has won!"
    end

    def get_next_move
      io.gets.chomp.to_i
    end

    private
  end
end
