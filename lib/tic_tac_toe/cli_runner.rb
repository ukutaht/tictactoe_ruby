module TicTacToe
  class CLIRunner
    attr_reader :game, :display
    def initialize(game, display)
      @game = game
      @display = display
    end

    def get_players
      case display.prompt_if_user_goes_first
      when 'y'
        game.human_goes_first
      when 'n'
        game.computer_goes_first
      end
    end

    def get_move
      index = display.prompt_move_index.to_i - 1
      game.make_move(index)
    end
  end
end
