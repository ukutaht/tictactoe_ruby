require 'qt'
require 'tic_tac_toe-core'

module TicTacToe
  module Qt_GUI
    class SettingsWidget < Qt::Widget
      attr_reader :game
      slots :start_game

      def initialize(game)
        super(nil)
        @game = game
        @buttons = []
      end

      def self.init(game)
        widget = self.new(game)
        widget.layout = Qt::VBoxLayout.new
        widget.create_settings_selection
        widget.create_start_game_button
        widget
      end

      def start_game
        all_checked_radio_buttons.each do |btn|
          case btn.object_name
          when 'Human vs Human'
            game.human_vs_human
          when 'Human vs Computer'
            game.human_goes_first
          when 'Computer vs Human'
            game.computer_goes_first
          when 'Computer vs Computer'
            game.computer_vs_computer
          when '3x3'
            game.set_board_size(3)
          when '4x4'
            game.set_board_size(4)
          end
        end
      end

      def all_checked_radio_buttons
        @buttons.select(&:checked?)
      end

      def create_settings_selection
        layout.add_layout(radio_buttons_for("Select game type", ['Human vs Human', 'Human vs Computer', 'Computer vs Human', 'Computer vs Computer']))

        layout.add_layout(radio_buttons_for("Select board size", ['3x3', '4x4']))
      end

      def create_start_game_button
        start_game_button = Qt::PushButton.new("Start game")
        start_game_button.object_name = ("Start game")
        connect(start_game_button, SIGNAL(:clicked), self, SLOT(:start_game))
        layout.add_widget(start_game_button)
      end

      def radio_buttons_for(label, options)
        group = Qt::ButtonGroup.new
        group.object_name = label
        radio_layout = Qt::HBoxLayout.new
        radio_layout.add_widget(Qt::Label.new(label))
        buttons = options.map do |option|
          button = Qt::RadioButton.new(option)
          button.object_name = option
          radio_layout.add_widget(button)
          group.add_button(button)
          @buttons << button
          button
        end
        buttons.first.checked = true
        radio_layout
      end
    end
  end
end
