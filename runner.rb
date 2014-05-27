# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tic_tac_toe'


game = TicTacToe::Game.new( board: TicTacToe::Board.new,
                            presenter: TicTacToe::CLI_Presenter.new(Kernel) )
game.play
