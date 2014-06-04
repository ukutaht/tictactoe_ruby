require 'spec_helper'

describe TicTacToe::CLIRunner do
  let(:game) { TicTacToe::Core::Game.new }
  let(:display) { TicTacToe::CLIDisplay.new(StringIO.new, StringIO.new)}
  let(:runner) { TicTacToe::CLIRunner.new(game, display)}

  context 'playing through the whole game' do
    before do
      display.input.string = "y\n0\n1\n2\n3\n4\n5\n6\n7\n8\nn\n"
      begin
       runner.play
      rescue SystemExit
      end
    end

    it 'gets the players' do
      expect(game.players.size).to eq 2
    end

    it 'plays through the whole game' do
      expect(game).to be_over
    end

    it 'announces the winner' do
      expect(display.output.string).to include "O has won!"
    end

    it 'prompts for another game' do
      expect(display.output.string).to include "play again?"
    end
  end

  it 'sets human as first player when user wants to go first' do
    display.input.string = "y"

    runner.get_players
    expect(game.current_player).to be_human
  end

  it 'sets computer as first player when user wants to go second' do
    display.input.string = "n"

    runner.get_players
    expect(game.current_player.mark).to eq "O"
  end

  it 'prompts for players again on invalid input' do
    display.input.string = "g\ny\n"

    runner.get_players
    expect(game.current_player).to be_human
  end

  context 'during game' do
    before { game.human_goes_first }

    it 'makes move on game based on user input' do
      display.input.string = "1"

      runner.play_turn
      expect(game.board.char_at(0)).to eq "X"
    end

    it 'promps user again if input was invalid' do
      display.input.string = "10\n1\n"

      expect(display).to receive(:invalid_input_message)
      runner.play_turn
    end
      
    it 'plays computer move after human' do
      display.input.string = "1"

      runner.play_turn
      expect(game.current_player).to be_human
    end
  end

  it 'plays again if player wants to play again' do
    display.input.string = "y"

    expect(runner).to receive(:play)
    runner.play_again_or_quit
    expect(game.players).to be_empty
  end

  it 'exits when player wants to quit' do
    display.input.string = "n"

    expect { runner.play_again_or_quit }.to raise_error SystemExit
  end
end