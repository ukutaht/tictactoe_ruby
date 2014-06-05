module TicTacToe
  module GUI
    class SetupController
      attr_reader :game
      
      def initialize(game)
        @game = game
      end

      def appropriate?
        game.need_players?
      end

      def on_click(x, y)
        if x.between?(200, 250) && y.between?(300, 320) 
          game.human_goes_first
        elsif x.between?(300, 350) && y.between?(300, 320)
          game.computer_goes_first
        end
      end

      def render_view(gui)
        gui.text_font.draw("Who should go first?", 200, 200, 0)
        gui.player_goes_first_button.draw(200, 300, 0, 1, 1, Gosu::Color::RED)
        gui.computer_goes_first_button.draw(300, 300, 0, 1, 1, Gosu::Color::RED)
      end
    end
  end
end
