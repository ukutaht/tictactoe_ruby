# coding: utf-8
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'tic_tac_toe-core'
require 'tic_tac_toe/cli/runner'
require 'tic_tac_toe/cli/display'
require 'tic_tac_toe/gui/player_picker_controller'
require 'tic_tac_toe/gui/player_picker_view'
require 'tic_tac_toe/gui/gameplay_controller'
require 'tic_tac_toe/gui/gameplay_view'
require 'tic_tac_toe/gui/final_screen_controller'
require 'tic_tac_toe/gui/final_screen_view'
require 'tic_tac_toe/gui/board_picker_controller'
require 'tic_tac_toe/gui/board_picker_view'
require 'tic_tac_toe/gui/display'
require 'tic_tac_toe/qt_gui/display'

module TicTacToe
  VERSION = "0.0.1"
end
