module TicTacToe
  module GUI
    class BoardPickerView
      attr_reader :gui

      def initialize(gui)
        @gui = gui
      end

      def which_button?(x, y)
        if x.between?(150, 300) && y.between?(300, 320) 
          :three_x_three
        elsif x.between?(400, 550) && y.between?(300, 320)
          :four_x_four
        end
      end

      def render
        draw_prompt
        draw_buttons
      end

      def draw_prompt
        Gosu::Font.new(gui, Gosu::default_font_name, 20).draw("Select board size", 200, 200, 0)
      end

      def draw_buttons
        draw_button("3x3", 150, 300)
        draw_button("4x4", 400, 300)
      end

      def draw_button(text, x, y)
        Gosu::Image.from_text(gui, text, Gosu::default_font_name, 20).draw(x ,y, 0)
      end

    end
  end
end
