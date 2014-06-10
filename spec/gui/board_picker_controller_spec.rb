require 'tic_tac_toe/gui/board_picker_controller' 

describe TicTacToe::GUI::BoardPickerController do

  let(:game) { double() }
  let(:view) { double() }
  let(:controller) { TicTacToe::GUI::BoardPickerController.new(game, view) }

  it 'is current when players collected and board size not set' do
    allow(game).to receive(:board_size_set?).and_return false
    allow(game).to receive(:need_players?).and_return false

    expect(controller).to be_current
  end

  it 'is not current when game needs players' do
    allow(game).to receive(:board_size_set?).and_return false
    allow(game).to receive(:need_players?).and_return true

    expect(controller).to_not be_current
  end

  it 'sets board size to 3x3 when button 3 is clicked' do
    allow(view).to receive(:which_button?).and_return :three_x_three

    expect(game).to receive(:set_board_size).with(3)   
    controller.on_click(:_, :_)
  end

  it 'sets board size to 4x4 when button 4 is clicked' do
    allow(view).to receive(:which_button?).and_return :four_x_four

    expect(game).to receive(:set_board_size).with(4)   
    controller.on_click(:_, :_)
  end

  it 'delegates render to view' do
    expect(view).to receive(:render)

    controller.render_view
  end
end

