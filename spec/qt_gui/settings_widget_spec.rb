require 'tic_tac_toe/qt_gui/settings_widget'
require 'qt_helper'

describe TicTacToe::Qt_GUI::SettingsWidget do
  before(:all) { Qt::Application.new([]) }
  let(:game) { TicTacToe::Core::Game.new }
  let(:window) { TicTacToe::Qt_GUI::SettingsWidget.init(game) }


  it 'displays player choices' do
    expect(window).to have_label('Select game type')
  end

  it 'displays board choice' do
    expect(window).to have_label('Select board size') 
  end

  it 'allows only one game type to be selected' do
    find_widget('Human vs Human').toggle
    find_widget('Computer vs Computer').toggle

    expect(find_widget('Human vs Human').checked).to be false
    expect(find_widget('Computer vs Computer').checked).to be true
  end

  it 'allows board and game type to be selected independently' do
    find_widget('Human vs Human').toggle
    find_widget('3x3').toggle

    expect(find_widget('Human vs Human').checked).to be true
    expect(find_widget('3x3').checked).to be true
  end

  

  it 'passes settings on to game' do
    window.display = double.as_null_object
    find_widget('Human vs Human').toggle
    find_widget('4x4').toggle
    find_widget("Start game").click
    
    expect(game.current_player).to be_human
    expect(game.board.size).to eq 4
  end

  it "resets the game when starting" do
    window.display = double.as_null_object

    window.start_game
    game.play_next_move(0)
    expect(game.board.char_at(0)).to eq('X')

    window.start_game

    expect(game.board.char_at(0)).to eq(' ')
    expect(window.display).to have_received(:add_board).twice
  end
end
