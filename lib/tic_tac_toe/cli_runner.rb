module TicTacToe
  class CLIRunner
    attr_reader :game, :display

    def initialize(game, display)
      @game = game
      @display = display
    end

    def play
      get_players
      until game.over?
        display.show_board(game.board_string)
        play_turn
      end
      game_over
    end

    def get_players
      case display.prompt_if_user_goes_first
      when 'y'
        game.human_goes_first
      when 'n'
        game.computer_goes_first
      else
        display.invalid_input_message
        get_players
      end
    end

    def play_turn
      until game.make_move(get_move)
        display.invalid_input_message
      end
      game.play_until_human_turn
    end

    def game_over
      display.show_board(game.board_string)
      display.announce_winner(game.winner)
      play_again_or_quit
    end


    def play_again_or_quit
      case display.prompt_to_play_again
      when 'y'
        game.reset!
        play
      when 'n'
        exit
      else
        play_again_or_quit
      end
    end

    def get_move
      display.prompt_move.to_i - 1
    end
  end
end
