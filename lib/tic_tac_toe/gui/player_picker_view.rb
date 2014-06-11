module TicTacToe
  module GUI
    class PlayerPickerView
      attr_reader :gui

      def initialize(gui)
        @gui = gui
      end

      def which_button?(x, y)
        if x.between?(150, 300) && y.between?(300, 320) 
          :human_first
        elsif x.between?(400, 550) && y.between?(300, 320)
          :computer_first
        elsif x.between?(150, 300) && y.between?(400, 420)
          :human_vs_human
        elsif x.between?(400, 550) && y.between?(400, 420)
          :computer_vs_computer
        end
      end

      def render
        draw_prompt
        draw_buttons
      end

      def draw_prompt
        Gosu::Font.new(gui, Gosu::default_font_name, 20).draw("Select game type", 200, 200, 0)
      end

      def draw_buttons
        draw_button("Human vs Computer", 150, 300)
        draw_button("Computer vs Human", 400, 300)
        draw_button("Human vs Human", 150, 400)
        draw_button("Computer vs Computer", 400, 400)
      end

      def draw_button(text, x, y)
        Gosu::Image.from_text(gui, text, Gosu::default_font_name, 20).draw(x ,y, 0)
      end
    end
  end
end
