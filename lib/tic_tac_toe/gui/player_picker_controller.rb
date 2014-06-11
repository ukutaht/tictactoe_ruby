module TicTacToe
  module GUI
    class PlayerPickerController
      attr_reader :game, :view
      
      def initialize(game, view)
        @game = game
        @view = view 
      end

      def current?
        game.need_players?
      end

      def update(coordinates)
        if !coordinates.empty?
          on_click(*coordinates)
        end
      end

      def on_click(x, y)
        case view.which_button?(x, y)
        when :human_first
          game.human_goes_first
        when :computer_first
          game.computer_goes_first
        when :human_vs_human
          game.human_vs_human
        when :computer_vs_computer
          game.computer_vs_computer
        end
      end

      def render_view
        view.render
      end
    end
  end
end
