require 'qt'
require 'tic_tac_toe/qt_gui/cell_label'

module TicTacToe
  module Qt_GUI
    class BoardWidget < Qt::Widget
      attr_reader :game, :grid, :timer
      attr_accessor :display
      slots :play_computer_move
      
      def self.init(game)
        w = self.new(game) 
        w.resize(600, 600)
        w.layout = w.grid
        w.build_grid
        connect(w.timer, SIGNAL(:timeout), w, SLOT(:play_computer_move))
        w.timer.start(500)
        w.update
        w
      end

      def initialize(game)
        super(nil)
        @timer = Qt::Timer.new
        @game = game
        @grid = Qt::GridLayout.new
      end

      def clicked(index)
        game.play_next_move(index) unless game.over?
        update
      end

      def play_computer_move
        game.play_next_move unless game.over?
        update
      end

      def build_grid
        0.upto((game.board.size ** 2) - 1) do |i|
          label = TicTacToe::Qt_GUI::CellLabel.new(i, self)
          label.object_name = "cell-#{i}"
          row, col = i.divmod(game.board.size)
          grid.add_widget(label, row, col)
        end
      end

      def update
        display.show_results if game.over?
        game.board.to_s.chars.each_with_index do |mark, i|
          grid.item_at(i).widget.text = mark
        end
      end
    end
  end
end
