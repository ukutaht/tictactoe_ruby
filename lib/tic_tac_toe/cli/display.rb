require 'colored'
module TicTacToe
  class CLIDisplay
    attr_accessor :input, :output
    
    def initialize(input=Kernel, output=Kernel)
      @input = input
      @output = output
    end

    def show_board(board)
      output.puts "\e[H\e[2J"
      output.puts add_color(build_board(board))
    end

    def invalid_input_message
      output.puts "Invalid input, try again."
    end

    def announce_winner(winner)
      if winner
        output.puts "#{winner} has won!"
      else
        output.puts "It's a draw!"
      end
    end

    def prompt_if_user_goes_first
      output.puts "Select game type: \n 1 - human vs computer\n 2 - computer vs human\n 3 - human vs human\n 4 - computer vs computer"
      input.gets.chomp
    end

    def prompt_board_size
      output.puts 'Select board size(3/4)'
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

    def add_color(string)
      string.chars.map do |char|
        case char
        when "X"
          char.red
        when "O"
          char.blue
        else
          char.white
        end
      end.join
    end

    def build_board(board_string)
      side_length = Math.sqrt(board_string.size).to_i  
      str = ""
      
      board_string.chars.each_slice(side_length).to_a.each_with_index do |row, i|
        unless i == 0
          str[-1] = "\n"
          str << "----|" * row.size
          str[-1] = "\n"
        end

        row.each_with_index do |square, j|
          unless j == 0
            str << "|"
          end
          if square != " "
            str << square.center(4)
          else
            str << (i * side_length + j + 1).to_s.center(4)
          end
        end
      end
      str
    end
  end
end
