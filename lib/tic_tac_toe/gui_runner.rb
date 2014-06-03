module TicTacToe
  class GUIRunner
    DISPLAY_WIDTH = 600
    attr_reader :game, :cell_width

    def initialize(game)
      @game = game
      @cell_width = DISPLAY_WIDTH / 3
    end

    def on_y_key
      if game.over?
        game.reset!
      else
        game.human_goes_first
      end
    end

    def on_n_key(gui)
      if game.over?
        gui.close
      else
        game.computer_goes_first
      end
    end

    def on_click(x, y)
      grid_index = get_index_in_grid(x, y)
      game.make_move(grid_index) if game.valid_move?(grid_index)
      game.play_until_input_needed
    end

    def collecting_players?
      game.need_players?
    end

    def show_results?
      game.over?
    end

    def winner_message
      game.winner ? "#{game.winner} Has won!" : "It's a draw!"
    end

    def get_index_in_grid(mouse_x, mouse_y)
      (mouse_x/cell_width).to_i + 3 * (mouse_y / cell_width).to_i
    end

    def draw_marks(gui)
      game.board_string.chars.each_with_index do |char, i|
        unless char == TicTacToe::Board::EMPTY
          x = (i % 3) * cell_width
          y = (i / 3) * cell_width
          gui.draw_cell(char, x, y)
        end
      end
    end
  end
end
