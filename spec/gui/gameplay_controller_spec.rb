require 'tic_tac_toe/gui/gameplay_controller'

describe TicTacToe::GUI::GameplayController do
  let(:game) { double() }
  let(:view) { double() }
  let(:controller) {TicTacToe::GUI::GameplayController.new(game, view)}

  it 'is current if game does not need players and is not over' do
    allow(game).to receive(:need_players?).and_return(false)
    allow(game).to receive(:over?).and_return(false)

    expect(controller.current?).to be_truthy
  end

  it 'is not current if game needs players' do
    allow(game).to receive(:need_players?).and_return(true)

    expect(controller.current?).to be_falsey
  end

  it 'is not current if game is over' do
    allow(game).to receive(:need_players?).and_return(false)
    allow(game).to receive(:over?).and_return(true)

    expect(controller.current?).to be_falsey
  end

  it 'sends play next move to game with correct index' do
    allow(view).to receive(:cell_index_for).with(0, 0).and_return(0)
    expect(game).to receive(:play_next_move).with(0)

    controller.on_click(0, 0) 
  end
end
