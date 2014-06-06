require_relative 'setup_view'
module TicTacToe
  module GUI
    class SetupController
      attr_reader :game, :view
      
      def initialize(game, view)
        @game = game
        @view = view 
      end

      def current?
        game.need_players?
      end

      def update
      end

      def on_click(x, y)
        case view.which_button?(x, y)
        when :player
          game.human_goes_first
        when :computer
          game.computer_goes_first
        end 
      end

      def render_view
        view.render
      end
    end
  end
end
