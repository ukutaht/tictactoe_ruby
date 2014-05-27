require 'spec_helper'
describe TicTacToe::HumanPlayer do
  let(:presenter) { double("presenter") }
  let(:player) { TicTacToe::HumanPlayer.new(mark: "X", presenter: presenter)}

  it 'delegates get_next_move to board with any arguments' do
    expect(presenter).to receive(:get_next_move)

    player.get_next_move("HELLO", "HI", 121)
  end
end
