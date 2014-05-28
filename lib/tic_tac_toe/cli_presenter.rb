require 'colored'
module TicTacToe
  class CLI_Presenter
    attr_reader :board, :current_player
    attr_accessor :io
    
    BOARD_STRING = <<-STRING.chomp
              * | * | *
             ---|---|---
              * | * | * 
             ---|---|---
              * | * | *
    STRING

    def initialize(io)
      @io = io
    end

    def get_player_types
      players = {}
      ["X", "O"].each do |mark|
        io.puts "Select player #{mark} 1-Human, 2-Computer"
        selection = io.gets.chomp
        if selection == "1"
          players[mark] = :human
        elsif selection == "2"
          players[mark] = :computer
        else
          io.puts 'Invalid option, try again'
          redo
        end
      end
      players
    end

    def display_board(board)
      io.puts "\e[H\e[2J"
      io.puts
      io.puts build_board(board)
      io.puts
    end

    def invalid_move_message
      io.puts "Invalid move, try again."
    end

    def announce_winner(winner)
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

     def build_board(board)
      board_str = BOARD_STRING.dup
      board.to_s.chars.to_a.each do |cell|
        board_str.sub!("*", cell == "X" ? cell.red : cell == "O" ?  cell.blue : cell)
      end
      board_str
     end
  end
end
