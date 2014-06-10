module TicTacToe
  module GUI
    class BoardPickerController
      attr_reader :game, :view

      def initialize(game, view)
        @game = game
        @view = view
      end

      def current?
        !game.need_players? && !game.board_size_set?
      end

      def update
      end

      def on_click(x, y)
        case view.which_button?(x, y)
        when :three_x_three
          game.set_board_size(3)
        when :four_x_four
          game.set_board_size(4)
        end
      end

      def render_view
        view.render
      end
    end
  end
end
