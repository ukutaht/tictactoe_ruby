module TicTacToe
  class CLIRunner
    attr_reader :game, :display

    def initialize(game, display)
      @game = game
      @display = display
    end

    def play
      get_options
      until game.over?
        display.show_board(game.board_string)
        play_turn
      end
      game_over
    end

    def get_options
      get_players
      get_board_size
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

    def get_board_size
      size = display.prompt_board_size.to_i
      until game.set_board_size(size)
        display.invalid_input_message
        size = display.prompt_board_size.to_i
      end
    end

    def play_turn
      until game.play_next_move(get_move)
        display.invalid_input_message
      end
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
      if game.current_player.human?
        display.prompt_move.to_i - 1 
      end
    end
  end
end
