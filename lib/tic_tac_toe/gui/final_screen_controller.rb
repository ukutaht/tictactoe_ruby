module TicTacToe
  module GUI
    class FinalScreenController
      attr_reader :game, :view

      def initialize(game, view)
        @game = game
        @view = view
      end

      def current?
        game.over? && !game.need_players?
      end

      def update
      end

      def on_click(x, y)
        case view.which_button?(x, y)
        when :play_again
          game.reset!
        when :exit
          exit
        end
      end

      def render_view
        view.render(game.winner)
      end
    end
  end
end
