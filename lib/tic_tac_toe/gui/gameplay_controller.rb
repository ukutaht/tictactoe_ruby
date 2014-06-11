require_relative 'gameplay_view'
module TicTacToe
  module GUI
    class GameplayController
      attr_reader :game, :cell_width, :view

      def initialize(game, view)
        @game = game
        @view = view
      end

      def current?
        !game.need_players? && !game.over?
      end

      def update(coordinates)
        if coordinates.empty?
          game.play_next_move
        else
          on_click(*coordinates)
        end
      end

      def on_click(x, y)
        board_index = view.cell_index_for(x, y, game.board.size)
        game.play_next_move(board_index) 
      end

      def render_view
        view.render(game.board)
      end
    end
  end
end
