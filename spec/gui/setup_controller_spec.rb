require 'tic_tac_toe/gui/setup_controller'

describe TicTacToe::GUI::SetupController do
  let(:game) { double() }
  let(:view) { double() }
  let(:controller) { TicTacToe::GUI::SetupController.new(game, view) }

  it 'is current if game needs players' do
    allow(game).to receive(:need_players?).and_return(true)

    expect(controller.current?).to be_truthy
  end

  it 'is not current if game does not needs players' do
    allow(game).to receive(:need_players?).and_return(false)

    expect(controller.current?).to be_falsey
  end

  it 'lets human go first if they click player button' do
    allow(view).to receive(:which_button?).and_return(:human_first)
    expect(game).to receive(:human_goes_first)

    controller.on_click(:_, :_)
  end

  it 'lets computer go first if player clicks computer button' do
    allow(view).to receive(:which_button?).and_return(:computer_first)
    expect(game).to receive(:computer_goes_first)

    controller.on_click(:_, :_)
  end

  it 'allows human vs human' do
    allow(view).to receive(:which_button?).and_return(:human_vs_human)
    expect(game).to receive(:human_vs_human)

    controller.on_click(:_, :_)
  end

  it 'allows computer vs computer' do
    allow(view).to receive(:which_button?).and_return(:computer_vs_computer)
    expect(game).to receive(:computer_vs_computer)

    controller.on_click(:_, :_)
  end

  it 'is a no-op when user does not hit a button' do
    allow(view).to receive(:which_button?).and_return(nil)

    controller.on_click(:_, :_)
  end
end
