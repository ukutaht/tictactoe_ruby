# coding: utf-8
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "tic_tac_toe/core/board"
require 'tic_tac_toe/core/game'
require 'tic_tac_toe/core/computer_player'
require 'tic_tac_toe/cli_runner'
require 'tic_tac_toe/cli_display'
require 'tic_tac_toe/gui_runner'
require 'tic_tac_toe/gui_display'

module TicTacToe
  VERSION = "0.0.1"
end
