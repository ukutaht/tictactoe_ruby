require 'tic_tac_toe/qt_gui/display'
require 'tic_tac_toe/core/game'
require 'qt_helper'

describe TicTacToe::Qt_GUI::Display do
  before(:all) { Qt::Application.new([]) }
  let(:game) { TicTacToe::Core::Game.new }
  let(:window) { TicTacToe::Qt_GUI::Display.new(game) }


end
