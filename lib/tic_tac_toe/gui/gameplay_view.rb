module TicTacToe
  module GUI
    class GameplayView
      attr_reader :gui
      
      def initialize(gui)
        @gui = gui
      end

      def cell_index_for(mouse_x, mouse_y, board_size)
         (mouse_x/@cell_width).to_i + board_size * (mouse_y / @cell_width).to_i
      end

      def render(board)
        draw_grid(board)
        draw_marks(board)
      end

      def draw_grid(board)
        @cell_width ||= gui.width / board.size

        (1...board.size).each do |n|
          start_point = @cell_width * n
          gui.draw_line(start_point, 0, Gosu::Color::WHITE, start_point, gui.width, Gosu::Color::WHITE)
          gui.draw_line(0, start_point, Gosu::Color::WHITE, gui.width, start_point, Gosu::Color::WHITE)
        end
      end

      def draw_marks(board)
        board.to_s.chars.each_with_index do |char, i|
          unless char == board.empty_square 
            x = (i % board.size) * @cell_width
            y = (i / board.size) * @cell_width
            draw_cell(char, x, y)
          end
        end
      end

      def draw_cell(char, x, y)
        font = Gosu::Font.new(gui, Gosu::default_font_name, @cell_width)
        font.draw(char, x + font.text_width(char)/3, y, 0)
      end
    end
  end
end
