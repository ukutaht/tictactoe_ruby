require 'tic_tac_toe/gui_runner'

describe TicTacToe::GUIRunner do
  let(:game) { double() }
  let(:runner) {TicTacToe::GUIRunner.new(game)}
  let(:display_width) { TicTacToe::GUIRunner::DISPLAY_WIDTH}

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

    expect(display).to receive(:draw_cell).with("X", 0, 0)
    runner.draw_marks(display)
  end

  it 'contains the logic of drawing marks' do
    gui = double("GUIDisplay")
    allow(game).to receive(:board_string).and_return("X        ")
    expect(gui).to receive(:draw_cell).with("X", 0, 0)
    runner.draw_marks(gui)
  end

  context 'collecting players' do
    before do
      allow(game).to receive(:need_players?).and_return true
    end

    it 'adds human player first if player presses y' do
      expect(game).to receive(:human_goes_first)
      runner.on_y_key
    end

    it 'adds computer first if player presses n' do
      expect(game).to receive(:computer_goes_first)
      runner.on_n_key(:irrelevant)
    end

    it 'knows when to collect players' do
      expect(runner.collecting_players?).to be_true
    end

    it 'blocks mouse when collecting players' do
      expect(runner.on_click(:_, :_)).to eq nil
    end
  end

  context 'option to play again' do
    before do
      allow(game).to receive(:over?).and_return true
    end

    it 'resets the game if player presses y' do
      expect(game).to receive(:reset!)
      runner.on_y_key
    end

    it 'closes gui if the player presses n' do
      gui = double("GUIDisplay")
      expect(gui).to receive(:close)
      runner.on_n_key(gui)
    end
  end

  it 'generates a winner message' do
    allow(game).to receive(:winner).and_return("X")
    expect(runner.winner_message).to include "X"
  end

  it 'generates different message when draw' do
    allow(game).to receive(:winner).and_return(false) 
    expect(runner.winner_message).to include "draw"
  end
end
