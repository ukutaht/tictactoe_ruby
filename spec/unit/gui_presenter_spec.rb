describe TicTacToe::GUIPresenter do
  let(:game) {TicTacToe::Game.new}
  let(:presenter) {TicTacToe::GUIPresenter.new(game)}
  let(:display_width) { TicTacToe::GUIPresenter::DISPLAY_WIDTH}
  before do
    game.add_human_player("X")
    game.add_human_player("O")
  end
  
  it 'plays a move when click is made' do
    presenter.on_click(0, 0)
    expect(game.board.valid_moves.length).to eq 8
  end

  it 'plays the move at the last index when bottom right corner is clicked' do
    presenter.on_click(display_width - 1, display_width - 1)
    expect(game.board.char_at(8)).to eq "X"
  end

  it 'plays the center index when center is clicked' do
    presenter.on_click(display_width / 3, display_width / 3)
    expect(game.board.char_at(4)).to eq "X"
  end

  it 'draws marks on the display' do
    game.make_move(0)
    display = double()

    expect(display).to receive(:draw_cell).with("X", 0, 0)
    presenter.draw_marks(display)
  end

  context 'collecting players' do
    before { game.reset! }
    it 'adds human player first if player presses y' do
      presenter.on_y_key
      expect(game.current_player).to be_human 
    end

    it 'adds computer first if player presses n' do
      presenter.on_n_key(:irrelevant)
      human = game.players.find{|p| p.human?}
      expect(human.mark).to eq "O"
    end

    it 'knows when were collecting players' do
      expect(presenter.collecting_players?).to be_true
    end
  end

  context 'option to play again' do
    let(:game) {TicTacToe::Game.new(TicTacToe::Board.new("XXX OOO  "))}

    it 'resets the game if player presses y' do
      presenter.on_y_key
      expect(game.players.size).to eq 0
    end
  end
end
