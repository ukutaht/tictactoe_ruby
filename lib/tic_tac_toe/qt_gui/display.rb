require 'qt'
require 'tic_tac_toe/qt_gui/settings_widget'
require 'tic_tac_toe/qt_gui/board_widget'

module TicTacToe
  module Qt_GUI
    class Display < Qt::Widget
      attr_accessor :game, :settings, :board

      def initialize(game)
        super(nil)
        @game = game
        self.layout = Qt::VBoxLayout.new
        @settings = TicTacToe::Qt_GUI::SettingsWidget.init(game)  
        settings.display = self
        layout.add_widget(settings)
        @message_box = Qt::Label.new
        @message_box.alignment = Qt::AlignHCenter
        layout.add_widget(@message_box)
      end

      def add_board
        @board.dispose if @board
        @board = TicTacToe::Qt_GUI::BoardWidget.init(game)
        @board.display = self
        layout.add_widget(@board)
      end

      def show_results
        @message_box.text = game.winner ? "#{game.winner} has won!" : "It's a draw!"
      end

      def reset_message_box
        @message_box.text = ""
      end
    end
  end
end
