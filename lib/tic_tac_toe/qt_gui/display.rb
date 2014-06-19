require 'qt'
require 'tic_tac_toe/qt_gui/settings_widget'
require 'tic_tac_toe/qt_gui/board_widget'

module TicTacToe
  module Qt_GUI
    class Display < Qt::Widget
      attr_reader :game

      def initialize(game)
        super(nil)
        @game = game
        self.layout = Qt::VBoxLayout.new
        layout.add_widget(TicTacToe::Qt_GUI::SettingsWidget.init(nil, game))
        layout.add_widget(TicTacToe::Qt_GUI::BoardWidget.init(nil, game))
      end

    end
  end
end
