require 'tic_tac_toe/qt_gui/display'
require 'tic_tac_toe/core/game'
require 'qt_helper'

describe TicTacToe::Qt_GUI::Display do
  before(:all) { Qt::Application.new([]) }
  let(:game) { TicTacToe::Core::Game.new }
  let(:window) { TicTacToe::Qt_GUI::Display.new(game) }

  it 'initializes with settings widget' do
    expect(window.find_child(TicTacToe::Qt_GUI::SettingsWidget)).to be_truthy
  end

  it "has a board widget when start game button is clicked" do
    expect(window.board).to be_nil
    
    window.settings.start_game

    expect(window.board).to be_truthy
    expect(window.board.parent).to be(window)
  end

  it 'cannot add more than one board' do
    window.settings.start_game
    expect{ window.settings.start_game }.to_not change{window.children.count}
  end

  it 'displays results' do
    over_game = TicTacToe::Core::Game.new(TicTacToe::Core::Board.new('XXX      '))
    window.game = over_game
    window.show_results

    expect(window).to have_label('X has won!')
  end
end
