require 'spec_helper'

describe TicTacToe::Game do
  let(:game) { TicTacToe::Game.new }

  it 'adds human players' do
    game.add_human_player("X")
    expect(game.current_player.mark).to eq "X"
  end

  it 'adds computer players' do
    game.add_computer_player("X")
    expect(game.current_player.mark).to eq "X"
  end

  it 'rejects more than three players' do
    game.add_human_player("X")
    game.add_human_player("O")
    game.add_human_player("Y")
    
    expect(game.players.size).to eq 2
  end

  context 'human vs human' do
    before do
      game.add_human_player("X")
      game.add_human_player("O")
    end
    
    it 'starts with the first person added' do
      expect(game.current_player.mark).to eq "X"
    end

    it 'plays the input move' do
      game.make_move(0)

      expect(game.board.char_at(0)).to eq "X"
    end

    it 'rotates players after every move' do
      game.make_move(0)
      expect(game.current_player.mark).to eq "O"
    end
  end
  
  it 'plays until game is over with two computers' do
    game.add_computer_player("X")
    game.add_computer_player("O") 

    game.play_until_input_needed
    expect(game.over?).to be_true
  end

  it 'gets rid of players on reset' do
    game.add_human_player("X")
    game.reset!
    expect(game.players.size).to eq 0
  end

  it 'resets board on reset' do
    game.add_human_player("X")
    game.make_move(0)
    game.reset!
    expect(game.board.valid_moves.size).to eq 9
  end

end
