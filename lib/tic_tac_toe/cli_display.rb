require 'colored'
module TicTacToe
  class CLIDisplay
    attr_accessor :input, :output
    
    BOARD_STRING = <<-STRING.chomp
              * | * | *
             ---|---|---
              * | * | * 
             ---|---|---
              * | * | *
    STRING

    def initialize(input=Kernel, output=Kernel)
      @input = input
      @output = output
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
      if winner
        io.puts "#{winner} has won!"
      else
        io.puts "It's a draw!"
      end
    end

    def get_next_move
      input.gets.chomp.to_i - 1
    end
    
     private

     def build_board(board)
      board_str = BOARD_STRING.dup
      board.chars.each do |cell|
        board_str.sub!("*", cell == "X" ? cell.red : cell == "O" ?  cell.blue : cell)
      end
      board_str
     end
  end
end
