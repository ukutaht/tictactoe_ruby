require 'tic_tac_toe/qt_gui/board_widget'
require 'tic_tac_toe-core'
require 'qt_helper'

describe TicTacToe::Qt_GUI::BoardWidget do
  before(:all) { Qt::Application.new([]) }
  let(:game) { TicTacToe::Core::Game.new }
  let(:window) { TicTacToe::Qt_GUI::BoardWidget.init(game) }

  context '4x4' do
    before do 
      game.set_board_size(4) 
      game.human_vs_human
    end

    it 'displays a move' do
      game.play_next_move(1)
      window.update

      expect(find_widget('cell-1').text).to eq "X"
    end

    it 'builds 4x4 board' do
      expect(window.find_children(TicTacToe::Qt_GUI::CellLabel).size).to eq 16
    end

    it 'draws empty squares when initialized' do
      16.times do |n|
        expect(find_widget("cell-#{n}").text).to eq ' '
      end
    end

    it 'makes move when cell clicked' do
      find_widget('cell-1').mousePressEvent(nil)
    
      expect(game.board.char_at(1)).to eq 'X'
    end

    it 'updates display after human move is made' do
      cell_4 = find_widget('cell-4')
      cell_4.mousePressEvent(nil)

      expect(cell_4.text).to eq "X"
    end

    it 'makes computer move after human move' do
      game.human_goes_first
      find_widget('cell-1').mousePressEvent(nil)
      emit window.timer.timeout()
      
      expect(game.board.valid_moves.length).to eq 14

      expect(window).to have_cell('O')
    end

    it 'does not make a computer move if there is no computer' do
      game.human_vs_human
      find_widget('cell-1').mousePressEvent(nil)
      
      expect(game.board.valid_moves.length).to eq 15
    end
  end

  context '3x3' do
    let(:game) { TicTacToe::Core::Game.new }
    let(:window){ TicTacToe::Qt_GUI::BoardWidget.init(game) }

    before do 
      game.set_board_size(3) 
    end

    it 'draws 3x3 board' do
      expect(window.find_children(TicTacToe::Qt_GUI::CellLabel).size).to eq 9
    end

    it 'plays through the whole when comp vs comp' do
      game.computer_vs_computer
      9.times { emit(window.timer.timeout()) }
      expect(game).to be_over
    end

    it 'does not try to make a comp move afte game is over' do
      game.computer_vs_computer
      expect { 10.times { emit(window.timer.timeout()) }}.to_not raise_error
    end

    it 'does not try make a human move after game is over' do
      game.human_vs_human
      [0, 1, 4, 5, 8].each do |i|
        game.play_next_move(i)
      end

      find_widget('cell-2').mousePressEvent(nil)
      expect(game.board.char_at(2)).to eq ' '
    end

    it 'can play through the whole game through gui' do
      game.human_vs_human

      [0, 1, 4, 5, 8].each do |i|
        find_widget("cell-#{i}").mousePressEvent(nil)
      end

      expect(game).to be_over
      expect(game.winner).to eq 'X'
    end
  end
end
