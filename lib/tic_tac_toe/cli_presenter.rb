module TicTacToe
  class CLI_Presenter
    attr_reader :board, :current_player
    attr_accessor :io
    
    BOARD_STRING = <<-STRING.chomp
              * | * | *
             ---|---|---
              * | * | * 
             ---|---|--
              * | * | *
   STRING

    def initialize(io)
      @io = io
    end

    def update_board(board)
      @board = board
    end
    
    def update_current_player(player)
      @current_player = player
    end

    def before_turn
      io.puts "\e[H\e[2J"
      display_board
    end

    def invalid_move_message
      io.puts "Invalid move, try again."
    end

    def announce_winner(winner)
      display_board
      if winner == :no_winner
        io.puts "It's a draw!"
      else
        io.puts "#{winner} has won!"
      end
    end

    def get_next_move
      io.gets.chomp.to_i - 1
    end
    
     private

     def display_board
      board_str = BOARD_STRING.dup
      board.to_s.chars.to_a.each do |cell|
        board_str.sub!("*", cell)
      end
      io.puts "              #{current_player.mark} turn!"
      io.puts
      io.puts board_str
      io.puts
     end
  end
end
