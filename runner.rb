# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tic_tac_toe'
presenter = TicTacToe::CLI_Presenter.new(io: Kernel) 
game = TicTacToe::Game.new(players: [TicTacToe::HumanPlayer.new(mark:"X", presenter: presenter), TicTacToe::ComputerPlayer.new(mark:"O") ],
                    board: TicTacToe::Board.new,
                    presenter: presenter)
game.play
