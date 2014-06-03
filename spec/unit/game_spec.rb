require 'spec_helper'

describe TicTacToe::Game do
  let(:game) { TicTacToe::Game.new }


  it 'plays the input move' do
    game.human_goes_first
    game.make_move(0)

    expect(game.board.char_at(0)).to eq "X"
  end

  it 'rotates players after every move' do
    game.human_goes_first
    game.make_move(0)

    expect(game.current_player.mark).to eq "O"
  end

  it 'plays until human move' do
    game.human_goes_first
    game.make_move(0)
    game.play_until_input_needed

    expect(game.current_player).to be_human
  end

  it 'plays until human move automatically when computer goes first' do
    game.computer_goes_first
    
    expect(game.current_player).to be_human
  end

  it 'gets rid of players on reset' do
    game.human_goes_first
    game.reset!

    expect(game.players.size).to eq 0
  end

  it 'resets board on reset' do
    game.human_goes_first
    game.make_move(0)
    game.reset!

    expect(game.board.valid_moves.size).to eq 9
  end
end
