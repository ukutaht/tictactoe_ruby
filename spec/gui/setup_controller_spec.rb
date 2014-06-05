require 'tic_tac_toe/gui/setup_controller'

describe TicTacToe::GUI::SetupController do
  let(:game) { double() }
  let(:controller) { TicTacToe::GUI::SetupController.new(game) }

  it 'lets human go first if they click player button' do
    expect(game).to receive(:human_goes_first)

    controller.on_click(200, 300)
  end

  it 'lets computer go first if player clicks computer button' do
    expect(game).to receive(:computer_goes_first)

    controller.on_click(300, 300)
  end

  it 'is a no-op when user does not hit a button' do
    controller.on_click(0,0)
  end
end
