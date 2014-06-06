module TicTacToe
  module GUI
    class FinalScreenView
      attr_reader :gui, :font

      def initialize(gui)
        @gui = gui
        @font = Gosu::Font.new(@gui, Gosu::default_font_name, 20)
        @play_again_button = Gosu::Image.from_text(gui, "Yes", Gosu::default_font_name, 20)
        @quit_button = Gosu::Image.from_text(gui, "No, quit", Gosu::default_font_name, 20)
      end

      def which_button?(x, y)
        if x.between?(200, 250) && y.between?(300, 320)
          :play_again
        elsif x.between?(300, 350) && y.between?(300, 320)
          exit
        end
      end

      def render(winner)
        draw_winner(winner)
        draw_prompt
        draw_buttons
      end

      def draw_winner(winner)
        msg = winner ? "#{winner} has won!" : "It's a draw!"
        
        font.draw(msg, 200, 100, 0)
      end
      
      def draw_prompt
        font.draw("Play again?", 200, 200, 0)
      end

      def draw_buttons
        @play_again_button.draw(200, 300, 0)
        @quit_button.draw(300, 300, 0)
      end


    end
  end
end
