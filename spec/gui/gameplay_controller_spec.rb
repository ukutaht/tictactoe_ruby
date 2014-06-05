require 'tic_tac_toe/gui/gameplay_controller'

describe TicTacToe::GUI::GameplayController do
  let(:game) { double() }
  let(:runner) {TicTacToe::GUI::GameplayController.new(game, 200)}
  let(:display_width) { 600 }

  before do
    allow(game).to receive(:need_players?).and_return false
    allow(game).to receive(:over?).and_return false
  end
  
  it 'plays a move when click is made' do
    expect(game).to receive(:make_move).with(0)
    runner.on_click(0, 0)
  end

  it 'plays the move at the last index when bottom right corner is clicked' do
    expect(game).to receive(:make_move).with(8)
    runner.on_click(display_width - 1, display_width - 1)
  end

  it 'plays the center index when center is clicked' do
    expect(game).to receive(:make_move).with(4)
    runner.on_click(display_width / 3, display_width / 3)
  end


  it 'draws marks on the display' do
    display = double()
    allow(game).to receive(:board_string).and_return "X        "
    allow(game).to receive(:board).and_return(double(:empty_square => " "))

    expect(display).to receive(:draw_cell).with("X", 0, 0)
    runner.draw_marks(display)
  end
end
