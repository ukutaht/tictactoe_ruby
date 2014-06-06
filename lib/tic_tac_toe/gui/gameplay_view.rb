module TicTacToe
  module GUI
    class GameplayView
      attr_reader :gui
      
      def initialize(gui)
        @gui = gui
      end

      def cell_index_for(mouse_x, mouse_y)
         (mouse_x/200).to_i + 3 * (mouse_y / 200).to_i
      end

      def render(board)
        draw_grid
        draw_marks(board)
      end

      def draw_grid
        [gui.cell_width, gui.cell_width*2].each do |coordinate|
          gui.draw_line(coordinate, 0, Gosu::Color::WHITE, coordinate, gui.width, Gosu::Color::WHITE)
          gui.draw_line(0, coordinate, Gosu::Color::WHITE, gui.width, coordinate, Gosu::Color::WHITE)
        end
      end

      def draw_marks(board)
        board.to_s.chars.each_with_index do |char, i|
          unless char == board.empty_square 
            x = (i % 3) * gui.cell_width
            y = (i / 3) * gui.cell_width
            draw_cell(char, x, y)
          end
        end
      end

      def draw_cell(char, x, y)
        font = Gosu::Font.new(gui, Gosu::default_font_name, gui.cell_width)
        font.draw(char, x + font.text_width(char)/3, y, 0)
      end
    end
  end
end
