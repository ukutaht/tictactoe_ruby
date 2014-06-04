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

    def show_board(board)
      output.puts "\e[H\e[2J"
      output.puts build_board(board)
    end

    def invalid_input_message
      output.puts "Invalid move, try again."
    end

    def announce_winner(winner)
      if winner
        output.puts "#{winner} has won!"
      else
        output.puts "It's a draw!"
      end
    end

    def prompt_if_user_goes_first
      output.print "Would you like to go first?(y/n)"
      input.gets.chomp
    end

    def prompt_move
      output.print "Your move: "
      input.gets.chomp
    end

    def prompt_to_play_again
      output.print "Do you wish to play again?"
      input.gets.chomp
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
