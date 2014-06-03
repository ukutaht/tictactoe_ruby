# coding: utf-8
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tic_tac_toe/board"
require 'tic_tac_toe/game'
require 'tic_tac_toe/human_player'
require 'tic_tac_toe/cli_presenter'
require 'tic_tac_toe/gui_runner'
require 'tic_tac_toe/gui_display'
require 'tic_tac_toe/computer_player'

module TicTacToe
  VERSION = "0.0.1"
end
