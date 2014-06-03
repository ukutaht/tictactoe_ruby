require 'spec_helper'

describe TicTacToe::CLIRunner do
  let(:game) { TicTacToe::Game.new }
  let(:display) { TicTacToe::CLIDisplay.new }
  let(:runner) { TicTacToe::CLIRunner.new(game, display)}

  it 'calls human goes when input is y' do
    allow(display).to receive(:prompt_if_user_goes_first).and_return('y')
    expect(game).to receive(:human_goes_first)
    runner.get_players
  end

  it 'calls human goes when input is y' do
    allow(display).to receive(:prompt_if_user_goes_first).and_return('n')
    expect(game).to receive(:computer_goes_first)
    runner.get_players
  end

  it 'makes move on game based on user input' do
    allow(display).to receive(:prompt_move).and_return("1")
    expect(game).to receive(:make_move).with(0)
    runner.get_move
  end

  it 'does not play the move if its invalid' do
    allow(display).to receive(:prompt_move).and_return("0")
    expect(game).to_not receive(:make_move)
    runner.get_move
  end
  end
  it 'tells game to play until input is needed after every move'
end
