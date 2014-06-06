module TicTacToe
  module GUI
    class SetupView
      attr_reader :gui

      def initialize(gui)
        @gui = gui
      end

      def which_button?(x, y)
        if x.between?(200, 250) && y.between?(300, 320) 
          :player
        elsif x.between?(300, 350) && y.between?(300, 320)
          :computer
        end
      end

      def render
        draw_prompt
        draw_buttons
      end

      def draw_prompt
        Gosu::Font.new(gui, Gosu::default_font_name, 20).draw("Who goes first?", 200, 200, 0)
      end

      def draw_buttons
        draw_button("Player", 200, 300)
        draw_button("Computer", 300, 300)
      end

      def draw_button(text, x, y)
        Gosu::Image.from_text(gui, text, Gosu::default_font_name, 20).draw(x ,y, 0)
      end
    end
  end
end
