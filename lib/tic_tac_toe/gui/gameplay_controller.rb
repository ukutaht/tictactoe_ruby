require 'tic_tac_toe/core/board'
module TicTacToe
  module GUI
    class GameplayController
      DISPLAY_WIDTH = 600
      attr_reader :game, :cell_width

      def initialize(game)
        @game = game
        @cell_width = DISPLAY_WIDTH / 3
      end

      def on_click(x, y)
         return if game.need_players? || game.over?

         grid_index = get_index_in_grid(x, y)
         game.make_move(grid_index) 
       end

      def get_index_in_grid(mouse_x, mouse_y)
         (mouse_x/cell_width).to_i + 3 * (mouse_y / cell_width).to_i
       end

       def draw_marks(gui)
         game.board_string.chars.each_with_index do |char, i|
           unless char == game.board.empty_square 
             x = (i % 3) * cell_width
             y = (i / 3) * cell_width
             gui.draw_cell(char, x, y)
           end
         end
       end

    end
  end
end
