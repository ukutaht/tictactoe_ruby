# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tic_tac_toe'

game = TicTacToe::Game.new(TicTacToe::Board.new)
presenter = TicTacToe::GUIPresenter.new(game)
display = TicTacToe::GUIDisplay.new(presenter, 600)

display.show
